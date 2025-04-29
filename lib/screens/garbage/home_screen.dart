import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String nomeUsuario;

  const HomeScreen({super.key, required this.nomeUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo, $nomeUsuario!'),
      ),
      body: const Center(
        child: Text('Você está logado na Home!'),
      ),
    );
  }
}
