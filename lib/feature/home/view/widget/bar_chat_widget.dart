import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ymgk_final_project/core/constant/app/color_constant.dart';
import 'package:ymgk_final_project/core/extension/context_extension.dart';
import 'package:ymgk_final_project/feature/home/cubit/home_state.dart';
import 'package:ymgk_final_project/feature/home/cubit/home_view_model.dart';

import '../../../../core/constant/app/application_constant.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final lineColor = ColorConstant.instance.lineColor;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.lowValue),
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 15, left: 10),
                child: RotatedBox(quarterTurns: 3, child: Text(ApplicationConstant.instance.bardataYInfo, style: buildTextStyle))),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: BlocBuilder<HomeViewModel, HomeState>(
                    builder: (context, state) {
                      return BarChart(
                        BarChartData(
                          groupsSpace: 1,
                          gridData: buildGridData(lineColor),
                          alignment: BarChartAlignment.start,
                          backgroundColor: const Color.fromARGB(255, 255, 249, 179).withOpacity(0.3),
                          minY: 0,
                          maxY: 8,
                          barGroups: [
                            buldChartGroupdata(1, state.gameList?[4].toDouble() ?? 0, ColorConstant.instance.cell1),
                            buldChartGroupdata(2, state.gameList?[3].toDouble() ?? 0, ColorConstant.instance.cell2),
                            buldChartGroupdata(3, state.gameList?[2].toDouble() ?? 0, ColorConstant.instance.cell3),
                            buldChartGroupdata(4, state.gameList?[1].toDouble() ?? 0, ColorConstant.instance.cell4),
                            buldChartGroupdata(5, state.gameList?[0].toDouble() ?? 0, ColorConstant.instance.cell5),
                          ],
                          borderData: buildBorderData(lineColor),
                          titlesData: buildTitlesData(),
                          // Diğer özelleştirmeler...
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }

  FlGridData buildGridData(Color lineColor) {
    return FlGridData(
      drawHorizontalLine: true,
      drawVerticalLine: true,
      verticalInterval: 0.2,
      show: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(strokeWidth: 2, color: lineColor);
      },
      getDrawingVerticalLine: (value) {
        return FlLine(strokeWidth: 2, color: lineColor);
      },
    );
  }

  FlBorderData buildBorderData(Color lineColor) {
    return FlBorderData(
      border: Border(
          left: BorderSide(color: lineColor, width: 2), // Sol sınır
          bottom: BorderSide(color: lineColor, width: 2), // Alt sınır
          top: BorderSide(color: lineColor, width: 2), // Üst sınır yok
          right: BorderSide(color: lineColor, width: 2) // Sağ sınır yok
          ),
    );
  }

  FlTitlesData buildTitlesData() {
    return FlTitlesData(
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            return Text(value.toInt().toString(), style: buildTextStyle);
          },
        ),
      ),
      bottomTitles: AxisTitles(
          sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          if (value % 1 == 0) {
            return Text("?", style: buildTextStyle);
          } else {
            return const Text("");
          }
        },
      )),
    );
  }

  TextStyle get buildTextStyle => const TextStyle(fontWeight: FontWeight.bold);

  BarChartGroupData buldChartGroupdata(int x, double y, Color color) {
    return BarChartGroupData(
      barsSpace: 5,
      x: x,
      barRods: [
        BarChartRodData(color: color, toY: y, width: 56, borderRadius: BorderRadius.zero),
      ],
    );
  }
}
