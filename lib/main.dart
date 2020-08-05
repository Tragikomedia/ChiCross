import 'package:flutter/material.dart';
import 'screens/game_screen.dart';
import 'package:chinese_picross/picross_files/games.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChiCross',
      home: GameScreen(game: games[0],)
    );
  }
}

