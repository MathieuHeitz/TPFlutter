import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxLayoutDemo extends StatelessWidget {

  const BoxLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Mise en page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            const Text(
                '1. Row - alignement start à gauche',
                style: TextStyle(fontWeight: FontWeight.bold)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _buildBoxes(3),
            ),
            const SizedBox(height: 20),
            const Text(
                '2. Row - spaceBetween',
                style: TextStyle(fontWeight: FontWeight.bold)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildBoxes(3),
            ),
            const SizedBox(height: 20),
            Text(
              '3. Column',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(
                  color: Colors.black87,
                  width: 2.0,
                )
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                  _buildBoxes(3)
                ,

              ),
            )

          ],
        ),
      ),
    );
  }

}

Widget _box (Color color) {
  return Container(
      width: 50,
      height: 50,
      color : color
  );
}

List<Widget> _buildBoxes(int count) {
  final colors = [Colors.red, Colors.green, Colors.blue];
  return List.generate(count, (index) => _box(colors[index % colors.length]));
}