

import 'package:flutter/material.dart';

class LayoutHelper {

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600;
  }

  static double width(BuildContext context) {
    return  MediaQuery.of(context).size.width;
  }

  static Orientation orientation(BuildContext context) {
    return  MediaQuery.of(context).orientation;
  }
}


class ResponsiveDemo extends StatelessWidget {

  const ResponsiveDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final screenWidth = LayoutHelper.width(context);
    final orientation = LayoutHelper.orientation(context);
    final isTablet = LayoutHelper.isTablet(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('RWD'),
        ),
        body: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Largeur de l\'écran  : ${screenWidth.toStringAsFixed(0)} px'),
                    Text('Orientation de l\'écran  : ${orientation == Orientation.portrait ? 'Portrait' : 'Paysage'}'),
                    Text('Appareil de l\'écran  : ${isTablet ? 'Tablette' : 'Mobile'}'),

                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          flex: 2, // Prend 2/3 de l'espace disponible
                          child: Container(
                            height: 60,
                            color: Colors.amber,
                            child: const Center(child: Text('Expanded')),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 16),

                    // 📦 Exemple 2 : Utilisation de Wrap pour adapter l’affichage selon la largeur
                    Wrap(
                      spacing: 8, // Espace horizontal entre les blocs
                      runSpacing: 8, // Espace vertical entre les lignes de Wrap
                      children: List.generate(6, (index) {
                        return Container(
                          // Largeur dynamique selon la taille de l'écran
                          width: screenWidth / (isTablet ? 3 : 2.3),
                          height: 80,
                          color: Colors.blue[(index + 1) * 100], // Couleur différente par index
                          child: Center(child: Text('Bloc ${index + 1}')),
                        );
                      }),
                    ),

                    const SizedBox(height: 16),
                    // Exemple 3 -  FittedBox pour redimensionner dynamiquement le texte

                    Container(
                      color: Colors.red,
                      height: 80,
                      child: const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                                'Text redimensionné dynamiquement',
                                style: TextStyle(fontSize: 32, color: Colors.white)
                            )
                        ),
                      ),
                    )

                  ],
                ),
              );
            }
        )
    );
  }

}