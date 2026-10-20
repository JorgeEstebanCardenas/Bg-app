import 'package:bg_app/data/game.dart';
import 'package:bg_app/components/game_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GameList extends StatefulWidget {
  const GameList({super.key});

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  late List<Game> _games;

  @override
  void initState() {
    super.initState();
    _games = [];
  }

  void _addGame(Game game) {
    setState(() {
      _games.insert(0, game);
    });
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Game session added: ${game.gameName}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showAddGameDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SingleChildScrollView(
          child: GameFormWidget(onGameCreated: _addGame),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Board Game Tracker'),
      ),
      body: _games.isEmpty
          ? const Center(
              child: Text(
                'No games played yet.\nTap + to add your first game!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _games.length,
              itemBuilder: (context, index) {
                final game = _games[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  child: ListTile(
                    leading: Icon(
                      game.won
                          ? Icons.emoji_events
                          : Icons.sentiment_dissatisfied,
                      color: game.won ? Colors.amber : Colors.grey,
                      size: 32,
                    ),
                    title: Text(
                      game.gameName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('MMM dd, yyyy - HH:mm').format(game.playedAt),
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: Chip(
                      label: Text(
                        game.won ? 'Won' : 'Lost',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: game.won ? Colors.green : Colors.red,
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddGameDialog,
        tooltip: 'Add Game Play',
        child: const Icon(Icons.add),
      ),
    );
  }
}
