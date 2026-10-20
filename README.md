# Board Game Tracker

A Flutter app to track your board game plays and results.

## Features

- 📝 Log board game plays with game name
- 🏆 Track wins and losses for each game
- 📅 Automatic timestamp for every play
- 📱 Clean, intuitive mobile interface
- ➕ Easy-to-use form for adding new plays

## Screenshots

The app displays your game history with:
- Trophy icons for wins, sad faces for losses
- Color-coded result chips (green for won, red for lost)
- Date and time of each play session

## Getting Started

### Prerequisites

- Flutter SDK (3.5.4 or higher)
- Dart SDK

### Installation

1. Clone the repository
```bash
git clone <your-repo-url>
cd flutter-app
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## Usage

1. Tap the **+** floating action button
2. Enter the name of the board game you played
3. Select whether you **Won** or **Lost**
4. Tap **Create Game** to save
5. Your play appears at the top of the list

## Project Structure

```
lib/
├── main.dart                    # App entry point
├── components/
│   ├── game_list.dart          # Main list view with game plays
│   └── game_form_widget.dart   # Form to add new plays
└── data/
    ├── game.dart               # Game model
    └── game_data.dart          # Sample data
```

## Future Enhancements

- Persistent storage (local database)
- Statistics and analytics
- Filter by game or date range
- Player tracking
- Game collection management
- Export play history
