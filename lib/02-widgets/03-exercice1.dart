import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accueil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade400),
        useMaterial3: true,
      ),
      home: const PageBienvenue(title: 'Accueil'),
    );
  }
}

class PageBienvenue extends StatefulWidget {
  final String title;
  const PageBienvenue({super.key, required this.title});

  @override
  State<PageBienvenue> createState() => _PageBienvenueState();
}

class _PageBienvenueState extends State<PageBienvenue> {
  String? _message;

  void _displayMessage() {
    setState(() {
      _message = "Merci d'avoir cliqué !";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Message s’il existe
            if (_message != null)
              Text(
                _message!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 20),
            Image.network(
              'https://tse4.mm.bing.net/th/id/OIP.rYxZUdVsK3F9pACTh_RbqgHaE8?cb=iwc1&rs=1&pid=ImgDetMain',
              height: 150,
            ),

            const SizedBox(height: 20),

            // Bouton
            ElevatedButton(
              onPressed: _displayMessage,
              child: const Text("Appuyer ici"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Astuce
            const Text(
              "Astuce : Tout est un widget !",
              style: TextStyle(fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
