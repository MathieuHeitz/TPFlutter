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
      ),
      home: const HomePage(),
    );
  }

}

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}


class _HomePageState extends State<HomePage> {

  final TextEditingController _controller = TextEditingController();

  void _navigateToPageDetail(){
    if(_controller.text.isNotEmpty){
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=> PageDetails(nom: _controller.text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Entrez votre nom'),
              const SizedBox(height: 12),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nom'
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _navigateToPageDetail,
                  child: const Text('Aller à la page suivante'))
            ],
          )


      ),
    );
  }


}

class PageDetails extends StatelessWidget {

  final String nom;

  const PageDetails({super.key, required this.nom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bonjour $nom", style: Theme.of(context).textTheme.headlineMedium,),
              ElevatedButton(onPressed: () =>Navigator.pop(context),
                  child: const Text('Aller à la page précédente'))
            ],
          )
      ),
    );
  }

}