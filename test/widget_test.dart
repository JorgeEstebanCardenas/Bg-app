import 'package:bg_app/data/game.dart';
import 'package:bg_app/components/game_form_widget.dart';
import 'package:bg_app/components/game_list.dart';
import 'package:bg_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Game', () {
    test('creates with required fields', () {
      final game = Game(gameName: 'Clank', won: true);
      expect(game.gameName, 'Clank');
      expect(game.won, true);
      expect(game.id, isNotEmpty);
      expect(game.playedAt, isA<DateTime>());
    });
  });

  group('GameFormWidget', () {
    testWidgets('shows form fields', (tester) async {
      Game? created;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: GameFormWidget(onGameCreated: (g) => created = g),
        ),
      ));

      expect(find.text('Add New Game Session'), findsOneWidget);
      expect(find.text('Game Name'), findsOneWidget);
      expect(find.text('Won'), findsOneWidget);
      expect(find.text('Lost'), findsOneWidget);
    });

    testWidgets('adds game with name and won result', (tester) async {
      Game? created;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: GameFormWidget(onGameCreated: (g) => created = g),
        ),
      ));

      await tester.enterText(find.byType(TextField), 'Clank');
      await tester.tap(find.text('Add Session'));
      await tester.pump();

      expect(created?.gameName, 'Clank');
      expect(created?.won, true);
    });

    testWidgets('adds game with lost result', (tester) async {
      Game? created;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: GameFormWidget(onGameCreated: (g) => created = g),
        ),
      ));

      await tester.enterText(find.byType(TextField), 'Fort');
      await tester.tap(find.text('Lost'));
      await tester.tap(find.text('Add Session'));
      await tester.pump();

      expect(created?.won, false);
    });

    testWidgets('shows error on empty name', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: GameFormWidget(onGameCreated: (_) {}),
        ),
      ));

      await tester.tap(find.text('Add Session'));
      await tester.pump();

      expect(find.text('Game name cannot be empty.'), findsOneWidget);
    });
  });

  group('GameList', () {
    testWidgets('shows empty state', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: GameList()));
      expect(find.text('No games played yet.\nTap + to add your first game!'),
          findsOneWidget);
    });

    testWidgets('opens form on FAB tap', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: GameList()));
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(GameFormWidget), findsOneWidget);
    });

    testWidgets('adds game to list', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: GameList()));

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Clank');
      await tester.tap(find.text('Add Session'));
      await tester.pumpAndSettle();

      expect(find.text('Clank'), findsOneWidget);
      expect(find.text('Won'), findsOneWidget);
    });
  });

  testWidgets('app runs', (tester) async {
    await tester.pumpWidget(const BGApp());
    expect(find.text('Board Game Tracker'), findsOneWidget);
  });
}
