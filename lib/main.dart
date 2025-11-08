import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CuanGhi',
      theme: ThemeData(
        primaryColor: const Color(0xFF00BFFF), // sky blue
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00BFFF)),
        scaffoldBackgroundColor: Colors.blue[50], // latar lembut
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF00BFFF),
          foregroundColor: Colors.white,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
