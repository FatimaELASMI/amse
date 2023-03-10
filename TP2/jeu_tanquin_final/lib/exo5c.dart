import 'package:flutter/material.dart';
import 'exo6a.dart' as exo6a;
import 'exo5b.dart' as exo5b;

class Tile {
  String imageURL;
  Alignment alignment;

  Tile({required this.imageURL, required this.alignment});

  Widget croppedImageTile(double gridSize) {
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

class DisplayImageWidget extends StatefulWidget {
  @override
  _DisplayImageWidgetState createState() => _DisplayImageWidgetState();
}

class _DisplayImageWidgetState extends State<DisplayImageWidget> {
  double _gridSize = 4;
  List<Tile> _tiles = [];

  @override
  void initState() {
    super.initState();
    _generateTiles();
  }

  void _generateTiles() {
    _tiles.clear();
    for (int i = 0; i < _gridSize * _gridSize; i++) {
      double x = (i % _gridSize) * (2 / (_gridSize - 1)) - 1;
      double y = (i ~/ _gridSize) * (2 / (_gridSize - 1)) - 1;
      _tiles.add(Tile(
          imageURL: 'assets/images/paris.jpg', alignment: Alignment(x, y)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display image'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              primary: false,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              crossAxisCount: _gridSize.toInt(),
              children: _tiles
                  .map((tile) => Container(
                        padding: const EdgeInsets.all(0),
                        child: InkWell(
                          child: tile.croppedImageTile(_gridSize),
                          onTap: () {
                            print("tapped on tile");
                          },
                        ),
                      ))
                  .toList(),
            ),
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.all(50)),
              SizedBox(height: 20),
              Text('Size'),
              Slider(
                value: _gridSize,
                min: 4,
                max: 8,
                divisions: 4,
                label: _gridSize.toInt().toString(),
                onChanged: (value) {
                  setState(() {
                    _gridSize = value;
                    _generateTiles();
                  });
                },
              ),
            ],
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
                          builder: (context) => exo5b.DisplayGridView(),
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
                        builder: (context) => exo6a.PositionedTiles(),
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
