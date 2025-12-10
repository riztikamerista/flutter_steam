import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steam Store Clone',
      debugShowCheckedModeBanner: false,

      // Mengatur Tema Gelap (Dark Theme) ala Steam
      theme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF171A21), // Warna primer
        scaffoldBackgroundColor: const Color(
          0xFF1E1E1E,
        ), // Warna abu-abu gelap background
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF171A21), // Warna header
          titleTextStyle: TextStyle(color: Color(0xFFC7D5E0), fontSize: 16),
          iconTheme: IconThemeData(color: Color(0xFFC7D5E0)),
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF171A21),
          selectedItemColor: Color(0xFFFFFFFF),
          unselectedItemColor: Color(0xFF757575),
        ),
        // Mengatur teks default agar sesuai dengan tema gelap
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: const HomePage(),
    );
  }
}
