import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Color(0xff6D77FB),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: const Color(0xff6D77FB),
          width: MediaQuery.sizeOf(context).width / 1.5,
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xff6D77FB),
        )),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xff6D77FB),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      title: 'Tic Tac Toe',
      home: const Home(),
    );
  }
}
