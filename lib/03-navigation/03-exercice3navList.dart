import 'dart:ffi';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
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

  final List<Map<String, dynamic>> productList = [
    {
      'name': 'Chaussures de course',
      'prix': 12.99,
      'description': 'Chaussures légères idéales pour le jogging quotidien.'
    },
    {
      'name': 'T-shirt en coton',
      'prix': 12.99,
      'description': 'T-shirt doux 100% coton, parfait pour l\'été.'
    },
    {
      'name': 'Sac à dos',
      'prix': 12.99,
      'description': 'Sac à dos robuste avec plusieurs compartiments.'
    },
  ];

  void _navigateToPageDetail(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context)=> ProductDetails(product: {},)));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Liste des produits', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return Card(
                    color: Colors.amberAccent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              product: product,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              'https://via.placeholder.com/150',
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product['name'],
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${product['price'].toStringAsFixed(2)} €',
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }




}

class ProductDetails extends StatelessWidget {

  final Map<String, dynamic> product;

  const ProductDetails({super.key, required this.product});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network('https://via.placeholder.com/150'),
            const SizedBox(height: 20),
            Text(
              product['description'],
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Prix : ${product['prix'].toString()} €',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () =>Navigator.pop(context),
              child: const Text('Retour'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber
              ),)
          ],

        ),

      ),
    );
  }
}

