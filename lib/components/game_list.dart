

import 'package:bg_app/data/game.dart';
import 'package:bg_app/data/game_data.dart';
import 'package:flutter/material.dart';

class GameList extends StatelessWidget {
  GameList({super.key});

  final List<Game> data = exampleData();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: ((context, index) {
          return ListTile(
            title: Text(data[index].gameName),
          );
        }
      )
    );
  }
}
