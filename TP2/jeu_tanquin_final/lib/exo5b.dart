import 'package:flutter/material.dart';
import 'dart:ui';

class Tile {
  final String imageURL;
  final Alignment alignment;

  const Tile({required this.imageURL, required this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.asset(this.imageURL),
          ),
        ),
      ),
    );
  }
}

Tile tile1 = new Tile(
    imageURL: 'assets/images/paris.jpg', alignment: Alignment(-1.0, -1.0));
Tile tile2 =
    new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(0, -1));
Tile tile3 =
    new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(1, -1));

Tile tile4 =
    new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(-1, 0));
Tile tile5 =
    new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(0, 0));
Tile tile6 =
    new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(1, 0));

Tile tile7 =
    new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(-1, 1));
Tile tile8 =
    new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(0, 1));
Tile tile9 = new Tile(
    imageURL: 'assets/images/paris.jpg', alignment: Alignment(1.0, 1.0));

class DisplayGridView extends StatelessWidget {
  List<Image> images = [
    Image.asset('assets/images/paris.jpg'),
  ];

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
          // children: List.generate(
          //   9,
          //   (index) => Container(
          //      margin: EdgeInsets.all(20.0),
          //         child: this.createTileWidgetFrom(tile${index + 1}))),
          children: [
            Container(
                margin: EdgeInsets.all(2.0),
                child: this.createTileWidgetFrom(tile1)),
            Container(
                margin: EdgeInsets.all(2.0),
                child: this.createTileWidgetFrom(tile2)),
            Container(
                margin: EdgeInsets.all(2.0),
                child: this.createTileWidgetFrom(tile3)),
            Container(
                margin: EdgeInsets.all(2.0),
                child: this.createTileWidgetFrom(tile4)),
            Container(
                margin: EdgeInsets.all(2.0),
                child: this.createTileWidgetFrom(tile5)),
            Container(
                margin: EdgeInsets.all(2.0),
                child: this.createTileWidgetFrom(tile6)),
            Container(
                margin: EdgeInsets.all(2.0),
                child: this.createTileWidgetFrom(tile7)),
            Container(
                margin: EdgeInsets.all(2.0),
                child: this.createTileWidgetFrom(tile8)),
            Container(
                margin: EdgeInsets.all(2.0),
                child: this.createTileWidgetFrom(tile9)),
          ]),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}
