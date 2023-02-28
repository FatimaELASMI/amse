import 'package:flutter/material.dart';
import 'dart:ui';

class DisplayGridView extends StatefulWidget {
  @override
  _DisplayGridViewState createState() => _DisplayGridViewState();
}

class _DisplayGridViewState extends State<DisplayGridView> {
  int gridSize = 3;

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
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              crossAxisCount: gridSize,
              children: List.generate(
                gridSize * gridSize,
                (index) => Container(
                  margin: EdgeInsets.all(2.0),
                  child: CroppedImageTile(
                    imageURL: 'assets/images/paris.jpg',
                    alignment: Alignment(
                      (index % gridSize) / (gridSize - 1),
                      (index ~/ gridSize) / (gridSize - 1),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Slider(
            value: gridSize.toDouble(),
            min: 3,
            max: 8,
            divisions: 6,
            onChanged: (value) {
              setState(() {
                gridSize = value.toInt();
              });
            },
          ),
        ],
      ),
    );
  }
}

class CroppedImageTile extends StatelessWidget {
  final String imageURL;
  final Alignment alignment;
  final gridSize = 3;

  const CroppedImageTile({
    required this.imageURL,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 1 / gridSize,
            heightFactor: 1 / gridSize,
            child: Image.asset(this.imageURL),
          ),
        ),
      ),
    );
  }
}
