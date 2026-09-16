import 'package:bg_app/data/game.dart';

class GameData {
  static final List<Game> _games = exampleData();
}

List<Game> exampleData() {
  return [
    Game(gameName: "Clank"),
    Game(gameName: "Fort"),
    Game(gameName: "Harmonies")
  ];
}
