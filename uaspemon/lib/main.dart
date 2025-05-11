import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/game_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = false;
  String player1 = 'Player 1';
  String player2 = 'Player 2';

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  void _updatePlayerNames(String p1, String p2) {
    setState(() {
      player1 = p1;
      player2 = p2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(onToggleTheme: _toggleTheme, player1: player1, player2: player2),
        '/game': (ctx) => GameScreen(player1: player1, player2: player2),
        '/settings': (ctx) => SettingsScreen(
          onToggleTheme: _toggleTheme,
          onSaveNames: _updatePlayerNames,
        ),
        '/splash': (ctx) => const SplashScreen(),
      },
    );
  }
}
