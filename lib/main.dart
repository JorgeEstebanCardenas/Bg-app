import 'package:bg_app/components/game_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BGApp());
}

class BGApp extends StatelessWidget {
  const BGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Board Game Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const GameList(),
    );
  }
}
