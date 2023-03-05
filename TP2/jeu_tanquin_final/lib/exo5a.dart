import 'dart:math' as math;
import 'exo4.dart' as exo4;
import 'exo5b.dart' as exo5b;
import 'package:flutter/material.dart';

math.Random random = new math.Random();

class Tile {
  Color? color;

  Tile(this.color);
  Tile.randomColor() {
    final r = random.nextInt(256);
    final g = random.nextInt(256);
    final b = random.nextInt(256);
    this.color = Color.fromARGB(255, r, g, b);
  }
}

class DisplayGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tile Grid View'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              crossAxisCount: 3,
              children: List.generate(
                9,
                (index) {
                  // générer des couleurs aléatoires pour les tuiles
                  Tile.randomColor();
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.all(2.0),
                    color: Tile.randomColor().color,
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 100.0),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => exo4.DisplayTileWidget(),
                        ),
                      );
                    },
                    elevation: 2.0,
                    fillColor: Colors.blue,
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => exo5b.DisplayGridView(),
                      ),
                    );
                  },
                  elevation: 2.0,
                  fillColor: Colors.blue,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 20.0,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
