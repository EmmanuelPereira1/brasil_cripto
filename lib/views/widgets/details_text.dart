import 'package:brasil_cripto/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  final String title;
  final String value;
  const DetailsText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                title,
                style: AppTextStyles.subtitle,
              ),
                Text(
                value,
                style: AppTextStyles.title,
              ),
              ],),
            );
  }
}