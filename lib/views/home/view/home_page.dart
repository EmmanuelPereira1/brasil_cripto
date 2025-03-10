import 'package:brasil_cripto/core/entity/entity_coin_list.dart';
import 'package:brasil_cripto/core/styles/app_colors.dart';
import 'package:brasil_cripto/providers.dart';
import 'package:brasil_cripto/views/home/view/details_coin.dart';
import 'package:brasil_cripto/views/widgets/coin_list_tile.dart';
import 'package:brasil_cripto/views/widgets/delete_confirmation_dialog.dart';
import 'package:brasil_cripto/views/widgets/favorite_button.dart';
import 'package:brasil_cripto/views/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brasil_cripto/views/home/cubit/bloc_coin_list_cubit.dart';
import 'package:brasil_cripto/core/local_storage/favorite_service.dart';

class HomeCoins extends StatefulWidget {
  const HomeCoins({super.key});

  @override
  State<HomeCoins> createState() => _HomeCoinsState();
}

class _HomeCoinsState extends State<HomeCoins> {
  late BlocCoinListCubit bloc;
  final FavoriteService _favoriteService = FavoriteService();
  bool isFavoritesFiltered = false;
  // ignore: prefer_final_fields
  TextEditingController _searchController = TextEditingController();
  List<EntityCoinList> allCoins = [];
  List<EntityCoinList> filteredCoins = [];

  @override
  void initState() {
    super.initState();
    bloc = AppGetIt.instance.get<BlocCoinListCubit>();
    bloc.fetchCoinList();
  }

  void _applyFilters() {
    setState(() {
      filteredCoins =
          allCoins.where((coin) {
            final matchesSearch =
                coin.name.toLowerCase().contains(
                  _searchController.text.toLowerCase(),
                ) ||
                coin.symbol.toLowerCase().contains(
                  _searchController.text.toLowerCase(),
                );

            final matchesFavorites =
                !isFavoritesFiltered || _favoriteService.isFavorite(coin.id);

            return matchesSearch && matchesFavorites;
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        elevation: 0,
        backgroundColor: AppColors.transparent,
      ),
      floatingActionButton: FavoriteButton(
        isFiltered: isFavoritesFiltered,
        onPressed: () {
          setState(() {
            isFavoritesFiltered = !isFavoritesFiltered;
          });
          _applyFilters();
        },
      ),
      body: BlocBuilder<BlocCoinListCubit, BlocCoinListState>(
        builder: (context, state) {
          if (state is BlocSuccess) {
            if (allCoins.isEmpty) {
              allCoins = state.entity!;
              filteredCoins = allCoins;
            }

            return Column(
              children: [
                SearchBarApp(
                  controller: _searchController,
                  onChanged: (_) => _applyFilters(),
                ),
                 filteredCoins.isEmpty
                ? Center(child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text('No cryptocurrencies found'),
                ))
                : Expanded(
                  child: ListView.builder(
                    itemCount: filteredCoins.length,
                    itemBuilder: (context, index) {
                      final coin = filteredCoins[index];
                      final isFav = _favoriteService.isFavorite(coin.id);
                      return CoinListTile(
                        coin: coin,
                        isFavorite: isFav,
                        onFavoritePressed: () {
                          if (isFav) {
                            showDeleteConfirmationDialog(
                              context,
                              coin.name,
                              () {
                                _favoriteService.toggleFavorite(coin.id);
                                _applyFilters();
                              },
                            );
                          } else {
                            _favoriteService.toggleFavorite(coin.id);
                            _applyFilters();
                          }
                        },
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => CoinDetailPage(coin: coin),
                              ),
                            );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
