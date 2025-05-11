import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  static const routeName = '/game';
  final String player1;
  final String player2;

  const GameScreen({Key? key, required this.player1, required this.player2}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String winner = '';

  void _tap(int index) {
    if (board[index] != '' || winner != '') return;

    setState(() {
      board[index] = currentPlayer;

      if (_checkWin(currentPlayer)) {
        winner = currentPlayer;
      } else if (!board.contains('')) {
        winner = 'Draw';
      } else {
        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
      }
    });
  }

  bool _checkWin(String player) {
    List<List<int>> winPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6],
    ];
    return winPatterns.any((pattern) => pattern.every((i) => board[i] == player));
  }

  void _reset() {
    setState(() {
      board = List.filled(9, '');
      currentPlayer = 'X';
      winner = '';
    });
  }

  String getCurrentPlayerName() {
    return currentPlayer == 'X' ? widget.player1 : widget.player2;
  }

  String getWinnerName() {
    if (winner == 'X') return widget.player1;
    if (winner == 'O') return widget.player2;
    return 'Draw';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reset,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            winner.isEmpty
                ? 'Giliran: ${getCurrentPlayerName()} ($currentPlayer)'
                : (winner == 'Draw' ? 'Seri!' : 'Pemenang: ${getWinnerName()} ($winner)'),
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: board.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _tap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: board[index].isEmpty
                          ? Colors.grey.shade200
                          : (board[index] == 'X' ? Colors.blue[100] : Colors.red[100]),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
