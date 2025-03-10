import 'package:brasil_cripto/core/entity/entity_coin_list.dart';
import 'package:brasil_cripto/core/styles/app_colors.dart';
import 'package:brasil_cripto/core/styles/app_text_styles.dart';
import 'package:brasil_cripto/views/widgets/details_text.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class CoinDetailPage extends StatelessWidget {
  final EntityCoinList coin;

  const CoinDetailPage({super.key, required this.coin});

  String formatCurrency(dynamic value) {
    final format = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    return format.format(value);
  }

  String formatPercentage(double value) {
    final formatter = NumberFormat.percentPattern('en_US');
    formatter.minimumFractionDigits = 2;
    formatter.maximumFractionDigits = 2;
    return formatter.format(value / 100);
  }

  double convertToDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    }
    if (value is double) {
      return value;
    }
    throw Exception('Tipo inesperado');
  }

  List<FlSpot> generateChartData() {
    return [
      FlSpot(0, convertToDouble(coin.currentPrice)),
      FlSpot(
        1,
        convertToDouble(coin.currentPrice) -
            convertToDouble(coin.priceChange24H) * 0.5,
      ),
      FlSpot(
        2,
        convertToDouble(coin.currentPrice) +
            convertToDouble(coin.priceChange24H) * 0.3,
      ),
      FlSpot(3, convertToDouble(coin.high24H)),
      FlSpot(4, convertToDouble(coin.low24H)),
      FlSpot(5, convertToDouble(coin.currentPrice)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coin.name)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(coin.image, width: 80)),
            SizedBox(height: 16),
            DetailsText(
              title: "Current price: ",
              value: formatCurrency(coin.currentPrice),
            ),
            DetailsText(
              title: "Price change percentage: ",
              value: formatPercentage(coin.priceChangePercentage24H),
            ),
            DetailsText(
              title: "Price Change 24H: ",
              value: formatCurrency(coin.priceChange24H),
            ),
            DetailsText(
              title: "High 24H: ",
              value: formatCurrency(coin.high24H),
            ),
            DetailsText(
              title: "Low 24H: ",
              value: formatCurrency(coin.low24H),
            ),
            DetailsText(
              title: "Total volume: ",
              value: formatCurrency(coin.totalVolume),
            ),
            SizedBox(height: 20),
            Text(
              "Graphic",
              style: AppTextStyles.title,
            ),
            SizedBox(height: 10),
            Flexible(
              child: SizedBox(
                height: 400,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: generateChartData(),
                        isCurved: true,
                        color: AppColors.green,
                        barWidth: 4,
                        belowBarData: BarAreaData(
                          show: true,
                          color: AppColors.green.withOpacity(0.3),
                        ),
                        dotData: FlDotData(show: true),
                      ),
                    ],
                    minX: 0,
                    maxX: 5,
                    minY: convertToDouble(coin.low24H) - 5,
                    maxY: convertToDouble(coin.high24H) + 5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
