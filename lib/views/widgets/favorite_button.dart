import 'package:brasil_cripto/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFiltered;
  final VoidCallback onPressed;

  const FavoriteButton({required this.isFiltered, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.black,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Icon(Icons.star, color: isFiltered ? AppColors.amber : AppColors.grey),
    );
  }
}
