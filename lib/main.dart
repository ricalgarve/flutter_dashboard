import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ThemeSwitcherApp());
}

class ThemeSwitcherApp extends StatefulWidget {
  const ThemeSwitcherApp({super.key});

  @override
  State<ThemeSwitcherApp> createState() => _ThemeSwitcherAppState();
}

class _ThemeSwitcherAppState extends State<ThemeSwitcherApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 217, 217, 218),
          onPrimary: Color.fromARGB(255, 3, 3, 3),
          secondary: Color.fromARGB(255, 0, 16, 155),
          onSecondary: Color.fromARGB(255, 24, 23, 23),
          surface: Color.fromARGB(223, 216, 236, 240),
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
          onPrimary: Color.fromARGB(255, 14, 13, 13),
          secondary: Color.fromARGB(255, 19, 18, 18),
          onSecondary: Color.fromARGB(255, 216, 215, 215),
          surface: Color(0xFF1E1E1E),
          onSurface: Color.fromARGB(255, 223, 220, 220),
          error: Colors.redAccent,
          onError: Colors.black,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: HomeScreen(onToggleTheme: toggleTheme),
    );
  }
}
