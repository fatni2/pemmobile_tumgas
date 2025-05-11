import 'package:flutter/material.dart';
import 'game_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  final VoidCallback onToggleTheme;
  final String player1;
  final String player2;

  const HomeScreen({
    Key? key,
    required this.onToggleTheme,
    required this.player1,
    required this.player2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tic Tac Toe')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
              child: const Text('Play'),
              onPressed: () {
                Navigator.pushNamed(context, GameScreen.routeName);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
              child: const Text('Settings'),
              onPressed: () {
                Navigator.pushNamed(context, SettingsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
