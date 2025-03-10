// ignore_for_file: deprecated_member_use

import 'package:brasil_cripto/core/entity/entity_coin_list.dart';
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(coin.image, width: 80)),
            SizedBox(height: 16),
            Center(
              child: Text(
                formatCurrency(coin.currentPrice),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  formatPercentage(coin.priceChangePercentage24H),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 20),
            Text(
              "Graphic",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Flexible(
              child: SizedBox(
                height: 300,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: generateChartData(),
                        isCurved: true,
                        color: Colors.green,
                        barWidth: 4,
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.green.withOpacity(0.3),
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
