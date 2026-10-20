class Game {
  final String id;
  final String gameName;
  final DateTime playedAt;
  final bool won;

  Game({
    String? id,
    required this.gameName,
    DateTime? playedAt,
    required this.won,
  })  : id = id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        playedAt = playedAt ?? DateTime.now();
}
