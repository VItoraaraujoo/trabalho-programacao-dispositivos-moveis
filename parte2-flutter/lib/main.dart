import 'package:flutter/material.dart';
import 'package:parte2_flutter/screens/home_page.dart';

void main() {
  runApp(const LacheDoTioJoaoApp());
}

class LacheDoTioJoaoApp extends StatelessWidget {
  const LacheDoTioJoaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    const coffee = Color(0xFF2B1712);
    const paper = Color(0xFFFFF7E8);
    const tomato = Color(0xFFE85C3B);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lache do tio joao',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: paper,
        fontFamily: 'Trebuchet MS',
        colorScheme: ColorScheme.fromSeed(
          seedColor: tomato,
          brightness: Brightness.light,
          primary: coffee,
          secondary: tomato,
          surface: paper,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: coffee,
          foregroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Color(0xFFE0D8CB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: tomato, width: 2),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
