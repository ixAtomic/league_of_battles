import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'home_page.dart';
import 'design.dart';
import 'package:provider/provider.dart';
import 'package:league_of_battles/providers/counter_provider.dart';
import 'package:league_of_battles/providers/user_provider.dart';

Future main() async {
  await dotenv.load();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        FutureProvider<User>(
          create: (context) =>
              User().getUser("e93bac52-bc99-11ed-afa1-0242ac120002"),
          initialData: User(),
          child: const HomePage(),
        ),
      ],
      child: const LeagueOfBattles(),
    ),
  );
}

class LeagueOfBattles extends StatelessWidget {
  const LeagueOfBattles({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'League of Battles',
      theme: Design.leagueOfBattlesTheme(),
      home: const HomePage(),
    );
  }
}
