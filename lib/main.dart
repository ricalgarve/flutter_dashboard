import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Importa o HomeScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 67, 166, 233),
          onPrimary: Color.fromARGB(255, 3, 3, 3),
          secondary: Color.fromARGB(255, 103, 69, 196),
          onSecondary: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
          error: Colors.red,
          onError: Colors.white,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color.fromARGB(255, 212, 213, 214),
          onPrimary: Color.fromARGB(255, 165, 163, 163),
          secondary: Color.fromARGB(255, 14, 13, 13),
          onSecondary: Colors.black,
          surface: Color(0xFF1E1E1E),
          onSurface: Color.fromARGB(255, 223, 220, 220),
          error: Colors.redAccent,
          onError: Colors.black,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system, // Pega automático: claro de dia, escuro de noite
      home: const HomeScreen(),
    );
  }
}
