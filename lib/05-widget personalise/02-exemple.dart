// 🎯 Objectif : Créer un composant bouton réutilisable avec texte dynamique

import 'package:flutter/material.dart';

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
      title: 'Bouton Custom Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Widget personalisé')),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyButton(
                text:"Enregistrer",
                textColor: Colors.white,
                backgroundColor: Colors.deepPurple,
                icon:const Icon(Icons.save),
                onTap: () => print("Enregistrement..."),
              ),
              const SizedBox(height: 16),
              MyButton(
                text:"Supprimer",
                textColor: Colors.white,
                backgroundColor: Colors.red,
                icon:const Icon(Icons.delete),
                onTap: () => print("Suppression..."),
              ),
              const SizedBox(height: 16),
              MyButton(
                text:"Modifier",
                textColor: Colors.white,
                backgroundColor: Colors.orangeAccent,
                icon:const Icon(Icons.save),
                onTap: () => print("Modification..."),
              ),
            ],
          )
      ),
    );
  }

}

class MyButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Widget? icon;
  final VoidCallback onTap;

  const MyButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.icon,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            backgroundColor: backgroundColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            )
        ),
        child: icon == null
            ? Text(
          text,
          style: const TextStyle(fontSize: 18),
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon!,
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            )
          ],
        )
    );
  }
}