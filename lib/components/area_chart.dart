import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:league_of_battles/models/user/user_models.dart';

class AreaChart extends StatelessWidget {
  final List<MatchModel>? matches;
  final TeamModel? team;
  const AreaChart({super.key, this.matches, this.team});

  List<FlSpot> buildSpots() {
    Map<String, int> dvp = getDateValuePairs(matches ?? [], team?.id);
    List<FlSpot> spots = dvp.keys
        .map((key) => FlSpot(
            DateTime.parse(key).microsecondsSinceEpoch.toDouble(),
            dvp[key]!.toDouble()))
        .toList();
    return spots;
  }

  Map<String, int> getDateValuePairs(List<MatchModel> matches, String? teamId) {
    Map<String, int> dvp = {};
    if (matches.isEmpty) return dvp;
    if (teamId == null) return dvp;
    for (var match in matches) {
      var date = getDatePart(match.matchDate!);
      if (match.winningTeam == teamId) {
        dvp[date] = (dvp[date] ?? 1) + 1;
      }
    }
    return dvp;
  }

  String getDatePart(String date) {
    return date.substring(0, 8);
  }

  @override
  Widget build(BuildContext context) {
    List<FlSpot> data = buildSpots();
    data.sort((a, b) => b.x.compareTo(a.x));
    return Expanded(
      //aspectRatio: 2.5,
      // constraints: const BoxConstraints(
      //   maxHeight: 60,
      //   minWidth: double.infinity,
      // ),
      flex: 3,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(show: false),
          lineTouchData: LineTouchData(enabled: false),
          gridData: FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: data,
              isCurved: true,
              color: Colors.transparent,
              dotData: FlDotData(
                show: false,
              ),
              //barWidth: 2,
              belowBarData: BarAreaData(
                  show: true,
                  gradient: const LinearGradient(
                    begin: Alignment
                        .topCenter, //starts the gradient at the bottom 1/4th of screen
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(158, 247, 148, 26),
                      Color.fromARGB(81, 247, 148, 26),
                      Color.fromARGB(1, 247, 148, 26),
                    ],
                  )),
            ),
          ],
          borderData: FlBorderData(show: false),
          minX: data.first.x,
          maxX: data.last.x,
          minY: 0,
        ),
      ),
    );
  }
}
