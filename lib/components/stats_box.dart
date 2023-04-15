import 'package:flutter/material.dart';
import 'package:league_of_battles/design.dart';
import 'package:league_of_battles/providers/counter_provider.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class StatsBox extends StatefulWidget {
  const StatsBox({Key? key}) : super(key: key);

  @override
  State<StatsBox> createState() => _StatsBoxState();
}

class _StatsBoxState extends State<StatsBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        context.read<Counter>().increment();
      }
    });

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentStatValue = context
            .watch<User>()
            .userResponseModel
            .stats
            ?.getCurrentValue(context.watch<Counter>().count) ??
        '';

    var currentKeyValue = context
            .watch<User>()
            .userResponseModel
            .stats
            ?.getCurrentKeyName(context.watch<Counter>().count, false) ??
        '';

    var currentShortKeyValue = context
            .watch<User>()
            .userResponseModel
            .sevenDayStats
            ?.getCurrentKeyName(context.watch<Counter>().count, true) ??
        '';

    var currentSevenDayStatsValue = context
            .watch<User>()
            .userResponseModel
            .sevenDayStats
            ?.getCurrentValue(context.watch<Counter>().count) ??
        '';
    return FadeTransition(
      opacity: _animation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Design.mediumText(
              currentKeyValue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              currentStatValue,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              '$currentShortKeyValue last 7 days - $currentSevenDayStatsValue',
              style: Design.lobTextTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }
}
