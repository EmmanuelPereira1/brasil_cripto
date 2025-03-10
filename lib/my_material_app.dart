import 'package:brasil_cripto/core/styles/app_colors.dart';
import 'package:brasil_cripto/providers.dart';
import 'package:brasil_cripto/views/home/cubit/bloc_coin_list_cubit.dart';
import 'package:brasil_cripto/views/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocCoinListCubit>(
          create:
              (BuildContext context) =>
                  AppGetIt.instance.get<BlocCoinListCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Brasil Cripto',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.yellow),
        ),
        home: const HomeCoins(),
      ),
    );
  }
}
