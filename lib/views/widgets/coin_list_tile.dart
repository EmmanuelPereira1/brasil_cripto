import 'package:brasil_cripto/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:brasil_cripto/core/entity/entity_coin_list.dart';
import 'package:brasil_cripto/core/styles/app_text_styles.dart';

class CoinListTile extends StatelessWidget {
  final EntityCoinList coin;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  final VoidCallback onTap;

  const CoinListTile({
    required this.coin,
    required this.isFavorite,
    required this.onFavoritePressed,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      onTap: onTap,
      leading: Image.network(coin.image, width: 40),
      title: Row(
        children: [
          Flexible(child: Text(coin.name, style: AppTextStyles.title, overflow: TextOverflow.ellipsis)),
          const SizedBox(width: 8),
          Text(coin.symbol.toUpperCase(), style: AppTextStyles.subtitle),
        ],
      ),
      subtitle: Text('\$${coin.currentPrice.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: Icon(isFavorite ? Icons.star : Icons.star_border, color: isFavorite ? AppColors.amber : AppColors.grey),
        onPressed: onFavoritePressed,
      ),
    );
  }
}
