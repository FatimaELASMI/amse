// import 'package:flutter/material.dart';
// import 'dart:ui';

// class DisplayGridView extends StatefulWidget {
//   @override
//   _DisplayGridViewState createState() => _DisplayGridViewState();
// }

// class _DisplayGridViewState extends State<DisplayGridView> {
//   int gridSize = 3;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tile Grid View'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.count(
//               padding: const EdgeInsets.all(10),
//               crossAxisSpacing: 2,
//               mainAxisSpacing: 2,
//               crossAxisCount: gridSize,
//               children: List.generate(
//                 gridSize * gridSize,
//                 (index) => Container(
//                   margin: EdgeInsets.all(2.0),
//                   child: CroppedImageTile(
//                     imageURL: 'assets/images/paris.jpg',
//                     alignment: Alignment(
//                       (index % gridSize) / (gridSize - 1),
//                       (index ~/ gridSize) / (gridSize - 1),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Slider(
//             value: gridSize.toDouble(),
//             min: 3,
//             max: 8,
//             divisions: 6,
//             onChanged: (value) {
//               setState(() {
//                 gridSize = value.toInt();
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CroppedImageTile extends StatelessWidget {
//   final String imageURL;
//   final Alignment alignment;
//   final gridSize = 3;

//   const CroppedImageTile({
//     required this.imageURL,
//     required this.alignment,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FittedBox(
//       fit: BoxFit.fill,
//       child: ClipRect(
//         child: Container(
//           child: Align(
//             alignment: this.alignment,
//             widthFactor: 1 / gridSize,
//             heightFactor: 1 / gridSize,
//             child: Image.asset(this.imageURL),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class Tile {
//   final String imageURL;
//   final Alignment alignment;

//   const Tile({required this.imageURL, required this.alignment});

//   Widget croppedImageTile() {
//     return FittedBox(
//       fit: BoxFit.fill,
//       child: ClipRect(
//         child: Container(
//           child: Align(
//             alignment: this.alignment,
//             widthFactor: 0.3,
//             heightFactor: 0.3,
//             child: Image.asset(this.imageURL),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Tile tile1 = new Tile(
//     imageURL: 'assets/images/paris.jpg', alignment: Alignment(-1.0, -1.0));
// Tile tile2 =
//     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(0, -1));
// Tile tile3 =
//     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(1, -1));

// Tile tile4 =
//     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(-1, 0));
// Tile tile5 =
//     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(0, 0));
// Tile tile6 =
//     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(1, 0));

// Tile tile7 =
//     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(-1, 1));
// Tile tile8 =
//     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(0, 1));
// Tile tile9 = new Tile(
//     imageURL: 'assets/images/paris.jpg', alignment: Alignment(1.0, 1.0));

// class DisplayGridView extends StatefulWidget {
//   @override
//   _DisplayGridViewState createState() => _DisplayGridViewState();
// }

// class _DisplayGridViewState extends State<DisplayGridView> {
//   int _sliderValue = 3;
//   List<Tile> _tiles = [
//     tile1,
//     tile2,
//     tile3,
//     tile4,
//     tile5,
//     tile6,
//     tile7,
//     tile8,
//     tile9
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tile Grid View'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.count(
//               padding: const EdgeInsets.all(10),
//               crossAxisSpacing: 2,
//               mainAxisSpacing: 2,
//               crossAxisCount: _sliderValue,
//               children: _tiles.map((tile) {
//                 return Container(
//                   margin: EdgeInsets.all(2.0),
//                   child: createTileWidgetFrom(tile),
//                 );
//               }).toList(),
//             ),
//           ),
//           Slider(
//             value: _sliderValue.toDouble(),
//             min: 1,
//             max: 8,
//             divisions: 7,
//             label: '${_sliderValue * _sliderValue} tiles',
//            onChanged: (value) {
//               setState(() {
//                 gridSize = value.toInt();
//               });
//             },
//         ],
//       ),
//     );
//   }
// }

// class CroppedImageTile extends StatelessWidget {
//   final String imageURL;
//   final Alignment alignment;
//   final gridSize = 3;

//   const CroppedImageTile({
//     required this.imageURL,
//     required this.alignment,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FittedBox(
//       fit: BoxFit.fill,
//       child: ClipRect(
//         child: Container(
//           child: Align(
//             alignment: this.alignment,
//             widthFactor: 1 / gridSize,
//             heightFactor: 1 / gridSize,
//             child: Image.asset(this.imageURL),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:ui';

// class Tile {
//   final String imageURL;
//   final Alignment alignment;

//   const Tile({required this.imageURL, required this.alignment});

//   Widget croppedImageTile() {
//     return FittedBox(
//       fit: BoxFit.fill,
//       child: ClipRect(
//         child: Container(
//           child: Align(
//             alignment: this.alignment,
//             widthFactor: 0.3,
//             heightFactor: 0.3,
//             child: Image.asset(this.imageURL),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DisplayGridView extends StatefulWidget {
//   @override
//   _DisplayGridViewState createState() => _DisplayGridViewState();
// }

// class _DisplayGridViewState extends State<DisplayGridView> {
//   late List<Tile> tiles;
//   int _divisions = 3;

//   @override
//   void initState() {
//     super.initState();
//     tiles = List.generate(
//       _divisions * _divisions,
//       (index) => Tile(
//         imageURL: 'assets/images/paris.jpg',
//         alignment: Alignment(
//           -1.0 + (2.0 / (_divisions - 1)) * (index % _divisions),
//           -1.0 + (2.0 / (_divisions - 1)) * (index ~/ _divisions),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tile Grid View'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.count(
//               padding: const EdgeInsets.all(10),
//               crossAxisSpacing: 2,
//               mainAxisSpacing: 2,
//               crossAxisCount: _divisions,
//               children: tiles
//                   .map(
//                     (tile) => Container(
//                       margin: EdgeInsets.all(2.0),
//                       child: InkWell(
//                         child: tile.croppedImageTile(),
//                         onTap: () {
//                           print("tapped on tile");
//                         },
//                       ),
//                     ),
//                   )
//                   .toList(),
//             ),
//           ),
//           Slider(
//             value: _divisions.toDouble(),
//             min: 3,
//             max: 8,
//             divisions: 3,
//             label: _divisions.toString(),
//             onChanged: (value) {
//               setState(() {
//                 _divisions = value.toInt();
//                 tiles = List.generate(
//                   _divisions * _divisions,
//                   (index) => Tile(
//                     imageURL: 'assets/images/paris.jpg',
//                     alignment: Alignment(
//                       -1.0 + (2.0 / (_divisions - 1)) * (index % _divisions),
//                       -1.0 + (2.0 / (_divisions - 1)) * (index ~/ _divisions),
//                     ),
//                   ),
//                 );
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

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
