import 'package:flutter/material.dart';
import 'package:league_of_battles/components/team_box.dart';
import 'package:league_of_battles/providers/user_provider.dart';
import 'design.dart';
import 'package:provider/provider.dart';
import 'providers/counter_provider.dart';
import 'components/stats_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Design.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
            title: const Text('Home'),
            centerTitle: true,
            titleTextStyle: const TextStyle(fontSize: 28, color: Colors.black),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
              ),
            ]),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 25),
              child: SizedBox(
                width: double.infinity,
                //height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Design.mediumText('Hello'),
                        Design.headlineSmall(Provider.of<User>(context)
                            .userResponseModel
                            .user
                            ?.userName),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 283,
              height: 151,
              margin: const EdgeInsets.only(bottom: 25),
              //alignment: const Alignment(0, -1),
              alignment: Alignment.center,
              decoration: Design.purpleBoxDecoration(),
              child: const StatsBox(),
            ),
            Container(
              width: double.infinity,
              //height: 30,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 5, bottom: 15),
              child: Design.mediumText('Teams'),
            ),
            const TeamBox(),
            Container(
              width: double.infinity,
              //height: 20,
              margin: const EdgeInsets.only(left: 5, bottom: 5),
              alignment: Alignment.centerLeft,
              child: Design.mediumText('Tournaments'),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 5, right: 5),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                  key: UniqueKey(),
                  width: 190,
                  margin: const EdgeInsets.only(
                      left: 2, top: 10, bottom: 10, right: 10),
                  decoration: Design.blueBoxDecoration(),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: const Color(0xff6A368B),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home',
                backgroundColor: Color(0xff6A368B),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                label: 'Search',
                backgroundColor: Color(0xff6A368B),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.monetization_on,
                  color: Colors.black,
                ),
                label: 'Coins',
                backgroundColor: Color(0xff6A368B),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.format_list_bulleted,
                  color: Colors.black,
                ),
                label: 'List',
                backgroundColor: Color(0xff6A368B),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: 'People',
                backgroundColor: Color(0xff6A368B),
              )
            ],
          ),
        ),
      ),
    );
  }
}
