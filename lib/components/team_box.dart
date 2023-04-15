import 'package:flutter/material.dart';
import '../design.dart';
import '../providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'area_chart.dart';

class TeamBox extends StatelessWidget {
  const TeamBox({super.key});

  String getTeamProp(String? prop, int index) {
    return '';
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var teamList =
        context.watch<User>().userResponseModel.teams ?? List.empty();

    return Container(
      height: 150,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 25),
      //padding: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: teamList.length,
        padding: const EdgeInsets.only(left: 5),
        itemBuilder: (context, index) => Container(
          key: UniqueKey(),
          width: 130,
          height: 150,
          margin: const EdgeInsets.only(left: 2, right: 10),
          decoration: Design.purpleBoxDecoration(),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  //margin: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Design.mediumText(teamList[index].team?.teamType),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Design.mediumText(
                              'W: ${teamList[index].team?.wins.toString()}',
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Design.mediumText(
                              'L: ${teamList[index].team?.loss.toString()}',
                            ),
                          ),
                        ],
                      ),
                      Design.mediumText(
                          'Position: ${teamList[index].team?.position.toString()}'),
                    ],
                  ),
                ),
              ),
              AreaChart(
                matches: teamList[index].matches,
                team: teamList[index].team,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
