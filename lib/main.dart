import 'package:flutter/material.dart';
//import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlphaTech Sistemas',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        //'/': (context) => const SplashScreen(),
        '/': (context) => const LoginScreen(),
        //'/login': (context) => const LoginScreen(),
        // Adicionaremos outras rotas depois
      },
    );
  }
}
