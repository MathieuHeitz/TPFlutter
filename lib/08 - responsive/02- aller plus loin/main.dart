import 'package:flutter/material.dart';
import 'responsive_scaffold.dart';



////////////////
////// OBJECTIF : AFFICHE UNE NAVIGATION QUI S'ADAPTE SELON LES DEVICES
////////////////

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Navigation Demo',
      home: ResponsiveNavigation(),
    );
  }
}
