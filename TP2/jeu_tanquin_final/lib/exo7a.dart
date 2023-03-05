import 'package:flutter/material.dart';
import 'dart:ui';

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
            child: Image.network(this.imageURL),
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
  String _imagePath = "assets/images/paris.jpg";

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
      _tiles.add(Tile(imageURL: _imagePath, alignment: Alignment(x, y)));
    }
  }

  void _pickImage() async {
    final imagePath = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ImagePicker(),
      ),
    );
    setState(() {
      _imagePath = imagePath;
      _generateTiles();
    });
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
          // ElevatedButton(
          //   onPressed: () async {
          //     final imagePicker = ImagePicker();
          //     final pickedFile = await imagePicker.pickImage(
          //       source: ImageSource.gallery,
          //     );
          //     if (pickedFile != null) {
          //       // TODO: do something with the picked file
          //     }
          //   },
          //   child: Text('Choose Image'),
          // ),
          GestureDetector(
            onTap: () {
              _pickImage();
              setState(() {
                _generateTiles();
              });
            },
            child: Image.asset(
              _imagePath,
              width: 200,
              height: 200,
            ),
          ),

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
          )
        ],
      ),
    );
  }
}

class ImagePicker extends StatelessWidget {
  final List<String> _imagePaths = [
    "assets/images/paris.jpg",
    "assets/images/flutter.png",
    "assets/images/paris1.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Image'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: _imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop(_imagePaths[index]);
            },
            child: Image.asset(
              _imagePaths[index],
              width: 100,
              height: 100,
            ),
          );
        },
      ),
    );
  }
}
