import 'package:flutter/material.dart';
import '02-exo mise en page.dart';

void main() {
  runApp(const MyApp());
}

// Widget racine de l'app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carte Utilisateur Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BoxLayoutDemo(),
    );
  }
}