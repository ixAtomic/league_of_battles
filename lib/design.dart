import 'package:flutter/material.dart';

class Design {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static ThemeData leagueOfBattlesTheme() {
    return ThemeData(
        fontFamily: 'cabin',
        textTheme: lobTextTheme,
        colorScheme: lobColorScheme);
  }

  static Text mediumText(String? text) {
    return Text(
      text ?? '',
      style: lobTextTheme.displayMedium,
    );
  }

  static Text headlineSmall(String? text) {
    return Text(
      text ?? 'empty',
      style: lobTextTheme.headlineSmall,
    );
  }

  static Decoration purpleBoxDecoration() {
    return const BoxDecoration(
      color: Color(0xff6A368B),
      borderRadius: BorderRadius.all(Radius.circular(5)),
      boxShadow: [
        BoxShadow(
          color: Colors.black38,
          spreadRadius: 0,
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
      ],
    );
  }

  static Decoration blueBoxDecoration() {
    return const BoxDecoration(
      color: Color(0xff707CD9),
      borderRadius: BorderRadius.all(Radius.circular(5)),
      boxShadow: [
        BoxShadow(
          color: Colors.black38,
          spreadRadius: 0,
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
      ],
    );
  }

  static var lobTextTheme = TextTheme(
    headlineLarge: const TextStyle(
        color: Colors.black, fontSize: 48, fontWeight: FontWeight.bold),
    headlineSmall: const TextStyle(
        color: Colors.black, fontSize: 26, fontWeight: FontWeight.w500),
    displayLarge: const TextStyle(color: Colors.white, fontSize: 26),
    displayMedium: const TextStyle(color: Colors.black, fontSize: 18),
    displaySmall: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 18),
  );

  static var lobColorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xff8800C7), primary: const Color(0xff53CAE4));

  static var background = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment(0, .3), //starts the gradient at the bottom 1/4th of screen
    end: Alignment(0, -.75),
    colors: [
      Color(0xff8800C7),
      Color(0xff53CAE4),
    ],
  ));
}
