import 'dart:math';

import 'package:flutter/material.dart';

class DisplayGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tile Grid View'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        crossAxisCount: 3,
        children: List.generate(
          9,
          (index) {
            // générer des couleurs aléatoires pour les tuiles
            final random = Random();
            final r = random.nextInt(256);
            final g = random.nextInt(256);
            final b = random.nextInt(256);
            final color = Color.fromARGB(255, r, g, b);
            return Container(
              padding: const EdgeInsets.all(8),
              margin: EdgeInsets.all(2.0),
              color: color,
              child: Center(
                child: Text(
                  'Tile ${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
