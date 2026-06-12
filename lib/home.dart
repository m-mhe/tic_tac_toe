import 'package:flutter/material.dart';
import 'package:tic_tac_toe/player_vs_ai.dart';
import 'package:tic_tac_toe/player_vs_player.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.videogame_asset_rounded,
          size: 28,
        ),
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '×',
              style: TextStyle(fontSize: 37),
            ),
            Icon(Icons.circle_outlined),
            Icon(Icons.crop_square_sharp)
          ],
        ),
      ),
      endDrawer: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '×',
                    style: TextStyle(fontSize: 37, color: Color(0xff6D77FB)),
                  ),
                  Icon(
                    Icons.circle_outlined,
                    color: Color(0xff6D77FB),
                  ),
                  Icon(
                    Icons.crop_square_sharp,
                    color: Color(0xff6D77FB),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const PlayerVsAI();
                    },
                  ),
                );
              },
              child: const Text(
                'Player VS AI',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const Divider(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const PlayerVsPlayer();
                    },
                  ),
                );
              },
              child: const Text(
                'Player VS Player',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const Divider(),
            TextButton(
              onPressed: () {},
              child: const Text(
                'About',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const PlayerVsAI();
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff6D77FB),
                  borderRadius: BorderRadius.circular(7),
                ),
                height: MediaQuery.sizeOf(context).height / 11,
                width: MediaQuery.sizeOf(context).height / 5,
                child: const Center(
                  child: Text(
                    'Player VS AI',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 22,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const PlayerVsPlayer();
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff6D77FB),
                  borderRadius: BorderRadius.circular(7),
                ),
                height: MediaQuery.sizeOf(context).height / 11,
                width: MediaQuery.sizeOf(context).height / 5,
                child: const Center(
                  child: Text(
                    'Player VS Player',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
