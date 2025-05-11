import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';
  final VoidCallback onToggleTheme;
  final void Function(String, String) onSaveNames;

  const SettingsScreen({Key? key, required this.onToggleTheme, required this.onSaveNames}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _player1Controller = TextEditingController();
  final TextEditingController _player2Controller = TextEditingController();

  @override
  void dispose() {
    _player1Controller.dispose();
    _player2Controller.dispose();
    super.dispose();
  }

  void _saveSettings() {
    final player1 = _player1Controller.text.trim().isEmpty ? 'Player 1' : _player1Controller.text.trim();
    final player2 = _player2Controller.text.trim().isEmpty ? 'Player 2' : _player2Controller.text.trim();

    widget.onSaveNames(player1, player2);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pengaturan disimpan')),
    );

    Navigator.pop(context); // kembali ke Home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _player1Controller,
              decoration: const InputDecoration(labelText: 'Nama Player 1'),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _player2Controller,
              decoration: const InputDecoration(labelText: 'Nama Player 2'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: widget.onToggleTheme,
              child: const Text('Toggle Dark/Light Theme'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _saveSettings,
              child: const Text('Simpan Pengaturan'),
            ),
          ],
        ),
      ),
    );
  }
}
