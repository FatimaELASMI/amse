import 'package:flutter/material.dart';
import 'dart:ui';

class DisplayGridView extends StatelessWidget {
  List<Widget> _generateTiles() {
    return [
      [-1, -1],
      [0, -1],
      [1, -1],
      [-1, 0],
      [0, 0],
      [1, 0],
      [-1, 1],
      [0, 1],
      [1, 1],
    ]
        .map((coords) =>
            croppedImageTile(coords[0].toDouble(), coords[1].toDouble()))
        .toList();
  }

  Widget croppedImageTile(double x, double y) {
    return InkWell(
      child: FittedBox(
          fit: BoxFit.fill,
          child: ClipRect(
            child: Container(
                child: Align(
              alignment: Alignment(x, y),
              widthFactor: 0.33,
              heightFactor: 0.33,
              child: Image.asset("assets/images/paris.jpg"),
            )),
          )),
      onTap: () {
        print('tapped on tile' + x.toString() + "" + y.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tile Grid View'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 3,
        children: this._generateTiles(),
      ),
    );
  }
}
