import 'package:flutter/material.dart';
import 'package:tic_tac_toe/player_vs_player.dart';

class PlayerVsAI extends StatefulWidget {
  const PlayerVsAI({super.key});

  @override
  State<PlayerVsAI> createState() => _PlayerVsAIState();
}

class _PlayerVsAIState extends State<PlayerVsAI> {
  static const String empty = 'img/solid.png';
  static const String xImg = 'img/x.png';
  static const String oImg = 'img/0.png';

  bool isItO = false;

  String imageForI = empty;
  String imageForII = empty;
  String imageForIII = empty;
  String imageForIV = empty;
  String imageForV = empty;
  String imageForVI = empty;
  String imageForVII = empty;
  String imageForVIII = empty;
  String imageForIX = empty;

  List<String> _board() => [
    imageForI,
    imageForII,
    imageForIII,
    imageForIV,
    imageForV,
    imageForVI,
    imageForVII,
    imageForVIII,
    imageForIX,
  ];

  void _setCell(int idx, String value) {
    switch (idx) {
      case 0:
        imageForI = value;
        break;
      case 1:
        imageForII = value;
        break;
      case 2:
        imageForIII = value;
        break;
      case 3:
        imageForIV = value;
        break;
      case 4:
        imageForV = value;
        break;
      case 5:
        imageForVI = value;
        break;
      case 6:
        imageForVII = value;
        break;
      case 7:
        imageForVIII = value;
        break;
      case 8:
        imageForIX = value;
        break;
    }
  }

  String _cell(int idx) {
    switch (idx) {
      case 0:
        return imageForI;
      case 1:
        return imageForII;
      case 2:
        return imageForIII;
      case 3:
        return imageForIV;
      case 4:
        return imageForV;
      case 5:
        return imageForVI;
      case 6:
        return imageForVII;
      case 7:
        return imageForVIII;
      case 8:
        return imageForIX;
      default:
        return empty;
    }
  }

  bool _isWinner(List<String> b, String p) {
    const lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (final line in lines) {
      if (b[line[0]] == p && b[line[1]] == p && b[line[2]] == p) {
        return true;
      }
    }
    return false;
  }

  bool _isDraw(List<String> b) => !b.contains(empty);

  int _minimaxScore(List<String> b, bool aiTurn) {
    if (_isWinner(b, oImg)) return 1;
    if (_isWinner(b, xImg)) return -1;
    if (_isDraw(b)) return 0;

    if (aiTurn) {
      int best = -999;
      for (int i = 0; i < 9; i++) {
        if (b[i] == empty) {
          b[i] = oImg;
          final score = _minimaxScore(b, false);
          b[i] = empty;
          if (score > best) best = score;
        }
      }
      return best;
    } else {
      int best = 999;
      for (int i = 0; i < 9; i++) {
        if (b[i] == empty) {
          b[i] = xImg;
          final score = _minimaxScore(b, true);
          b[i] = empty;
          if (score < best) best = score;
        }
      }
      return best;
    }
  }

  int _bestMove() {
    final b = _board();

    if (_isWinner(b, xImg) || _isWinner(b, oImg) || _isDraw(b)) {
      return -1;
    }

    int bestScore = -999;
    int bestMove = -1;

    for (int i = 0; i < 9; i++) {
      if (b[i] == empty) {
        b[i] = oImg;
        final score = _minimaxScore(b, false);
        b[i] = empty;

        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }

    return bestMove;
  }

  void clean() {
    setState(() {
      imageForI = empty;
      imageForII = empty;
      imageForIII = empty;
      imageForIV = empty;
      imageForV = empty;
      imageForVI = empty;
      imageForVII = empty;
      imageForVIII = empty;
      imageForIX = empty;
      isItO = false;
    });
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xff6D77FB),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          content: Text(
            message,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xff6D77FB),
              ),
              onPressed: () {
                setState(() {
                  clean();
                });
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        );
      },
    );
  }

  void gameOver() {
    if (_isDraw(_board())) {
      _showDialog('Draw!', 'This is a draw match.');
    }
  }

  void whoWon() {
    final b = _board();

    if (_isWinner(b, xImg)) {
      _showDialog('Congratulations!', 'You Won.');
    } else if (_isWinner(b, oImg)) {
      _showDialog('Better luck next time!', 'AI won.');
    } else {
      gameOver();
    }
  }

  void miniMax({
    int? bestMove,
    required int turn,
    required String imageI,
    required String imageII,
    required String imageIII,
    required String imageIV,
    required String imageV,
    required String imageVI,
    required String imageVII,
    required String imageVIII,
    required String imageIX,
  }) {
    final board = [
      imageI,
      imageII,
      imageIII,
      imageIV,
      imageV,
      imageVI,
      imageVII,
      imageVIII,
      imageIX,
    ];

    if (_isWinner(board, xImg) || _isWinner(board, oImg) || _isDraw(board)) {
      return;
    }

    final move = _bestMove();
    if (move == -1) return;

    setState(() {
      _setCell(move, oImg);
    });

    whoWon();
  }

  void _onTapCell(int index) {
    if (_cell(index) != empty) return;

    setState(() {
      _setCell(index, xImg);
      isItO = false;
    });

    whoWon();
    if (_isWinner(_board(), xImg) || _isDraw(_board())) return;

    miniMax(
      turn: 1,
      imageI: imageForI,
      imageII: imageForII,
      imageIII: imageForIII,
      imageIV: imageForIV,
      imageV: imageForV,
      imageVI: imageForVI,
      imageVII: imageForVII,
      imageVIII: imageForVIII,
      imageIX: imageForIX,
    );
  }

  Widget _cellWidget(int index) {
    return InkWell(
      onTap: () => _onTapCell(index),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(_cell(index)),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(title: const Text('Player VS AI')),
      endDrawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '×',
                    style: TextStyle(fontSize: 37, color: Color(0xff6D77FB)),
                  ),
                  Icon(Icons.circle_outlined, color: Color(0xff6D77FB)),
                  Icon(Icons.crop_square_sharp, color: Color(0xff6D77FB)),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlayerVsPlayer(),
                  ),
                );
              },
              child: const Text('Player VS Player', style: TextStyle(fontSize: 14)),
            ),
            const Divider(),
            TextButton(
              onPressed: () {},
              child: const Text('About', style: TextStyle(fontSize: 14)),
            ),
            const Divider(),
          ],
        ),
      ),
      body: Center(
        child: SizedBox(
          width: size,
          height: size,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(16),
            children: List.generate(9, _cellWidget),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clean();
          });
        },
        child: const Icon(Icons.restart_alt_rounded),
      ),
    );
  }
}