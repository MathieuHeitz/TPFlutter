import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter2/04-architecture%20et%20gestion%20etats/providers/counter_provider.dart';
import 'package:flutter2/04-architecture%20et%20gestion%20etats/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: const MyApp(),
      ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accueil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
      ),
      home: const HomeScreen(),
    );
  }

}


