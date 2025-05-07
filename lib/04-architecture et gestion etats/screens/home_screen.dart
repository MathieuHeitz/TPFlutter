import 'package:flutter/material.dart';
import 'package:flutter2/04-architecture%20et%20gestion%20etats/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget{

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(
          title: const Text('Provider Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Valeur actuelle: ", style: Theme
              .of(context)
              .textTheme
              .titleMedium,),
          const SizedBox(height: 10),
          Text("${count.value}",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => context.read<CounterProvider>().increment(),
              // ici on déclenche la methode 'incrementer' du privider
              child: const Text("Incrementer"))
        ],

      ),
    );
  }
  }

