// // import 'package:flutter/material.dart';
// // import 'dart:ui';

// // class DisplayGridView extends StatefulWidget {
// //   @override
// //   _DisplayGridViewState createState() => _DisplayGridViewState();
// // }

// // class _DisplayGridViewState extends State<DisplayGridView> {
// //   int gridSize = 3;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Tile Grid View'),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: GridView.count(
// //               padding: const EdgeInsets.all(10),
// //               crossAxisSpacing: 2,
// //               mainAxisSpacing: 2,
// //               crossAxisCount: gridSize,
// //               children: List.generate(
// //                 gridSize * gridSize,
// //                 (index) => Container(
// //                   margin: EdgeInsets.all(2.0),
// //                   child: CroppedImageTile(
// //                     imageURL: 'assets/images/paris.jpg',
// //                     alignment: Alignment(
// //                       (index % gridSize) / (gridSize - 1),
// //                       (index ~/ gridSize) / (gridSize - 1),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Slider(
// //             value: gridSize.toDouble(),
// //             min: 3,
// //             max: 8,
// //             divisions: 6,
// //             onChanged: (value) {
// //               setState(() {
// //                 gridSize = value.toInt();
// //               });
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class CroppedImageTile extends StatelessWidget {
// //   final String imageURL;
// //   final Alignment alignment;
// //   final gridSize = 3;

// //   const CroppedImageTile({
// //     required this.imageURL,
// //     required this.alignment,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return FittedBox(
// //       fit: BoxFit.fill,
// //       child: ClipRect(
// //         child: Container(
// //           child: Align(
// //             alignment: this.alignment,
// //             widthFactor: 1 / gridSize,
// //             heightFactor: 1 / gridSize,
// //             child: Image.asset(this.imageURL),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // class Tile {
// //   final String imageURL;
// //   final Alignment alignment;

// //   const Tile({required this.imageURL, required this.alignment});

// //   Widget croppedImageTile() {
// //     return FittedBox(
// //       fit: BoxFit.fill,
// //       child: ClipRect(
// //         child: Container(
// //           child: Align(
// //             alignment: this.alignment,
// //             widthFactor: 0.3,
// //             heightFactor: 0.3,
// //             child: Image.asset(this.imageURL),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // Tile tile1 = new Tile(
// //     imageURL: 'assets/images/paris.jpg', alignment: Alignment(-1.0, -1.0));
// // Tile tile2 =
// //     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(0, -1));
// // Tile tile3 =
// //     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(1, -1));

// // Tile tile4 =
// //     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(-1, 0));
// // Tile tile5 =
// //     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(0, 0));
// // Tile tile6 =
// //     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(1, 0));

// // Tile tile7 =
// //     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(-1, 1));
// // Tile tile8 =
// //     new Tile(imageURL: 'assets/images/paris.jpg', alignment: Alignment(0, 1));
// // Tile tile9 = new Tile(
// //     imageURL: 'assets/images/paris.jpg', alignment: Alignment(1.0, 1.0));

// // class DisplayGridView extends StatefulWidget {
// //   @override
// //   _DisplayGridViewState createState() => _DisplayGridViewState();
// // }

// // class _DisplayGridViewState extends State<DisplayGridView> {
// //   int _sliderValue = 3;
// //   List<Tile> _tiles = [
// //     tile1,
// //     tile2,
// //     tile3,
// //     tile4,
// //     tile5,
// //     tile6,
// //     tile7,
// //     tile8,
// //     tile9
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Tile Grid View'),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: GridView.count(
// //               padding: const EdgeInsets.all(10),
// //               crossAxisSpacing: 2,
// //               mainAxisSpacing: 2,
// //               crossAxisCount: _sliderValue,
// //               children: _tiles.map((tile) {
// //                 return Container(
// //                   margin: EdgeInsets.all(2.0),
// //                   child: createTileWidgetFrom(tile),
// //                 );
// //               }).toList(),
// //             ),
// //           ),
// //           Slider(
// //             value: _sliderValue.toDouble(),
// //             min: 1,
// //             max: 8,
// //             divisions: 7,
// //             label: '${_sliderValue * _sliderValue} tiles',
// //            onChanged: (value) {
// //               setState(() {
// //                 gridSize = value.toInt();
// //               });
// //             },
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class CroppedImageTile extends StatelessWidget {
// //   final String imageURL;
// //   final Alignment alignment;
// //   final gridSize = 3;

// //   const CroppedImageTile({
// //     required this.imageURL,
// //     required this.alignment,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return FittedBox(
// //       fit: BoxFit.fill,
// //       child: ClipRect(
// //         child: Container(
// //           child: Align(
// //             alignment: this.alignment,
// //             widthFactor: 1 / gridSize,
// //             heightFactor: 1 / gridSize,
// //             child: Image.asset(this.imageURL),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'dart:ui';

// // class Tile {
// //   final String imageURL;
// //   final Alignment alignment;

// //   const Tile({required this.imageURL, required this.alignment});

// //   Widget croppedImageTile() {
// //     return FittedBox(
// //       fit: BoxFit.fill,
// //       child: ClipRect(
// //         child: Container(
// //           child: Align(
// //             alignment: this.alignment,
// //             widthFactor: 0.3,
// //             heightFactor: 0.3,
// //             child: Image.asset(this.imageURL),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class DisplayGridView extends StatefulWidget {
// //   @override
// //   _DisplayGridViewState createState() => _DisplayGridViewState();
// // }

// // class _DisplayGridViewState extends State<DisplayGridView> {
// //   late List<Tile> tiles;
// //   int _divisions = 3;

// //   @override
// //   void initState() {
// //     super.initState();
// //     tiles = List.generate(
// //       _divisions * _divisions,
// //       (index) => Tile(
// //         imageURL: 'assets/images/paris.jpg',
// //         alignment: Alignment(
// //           -1.0 + (2.0 / (_divisions - 1)) * (index % _divisions),
// //           -1.0 + (2.0 / (_divisions - 1)) * (index ~/ _divisions),
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Tile Grid View'),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: GridView.count(
// //               padding: const EdgeInsets.all(10),
// //               crossAxisSpacing: 2,
// //               mainAxisSpacing: 2,
// //               crossAxisCount: _divisions,
// //               children: tiles
// //                   .map(
// //                     (tile) => Container(
// //                       margin: EdgeInsets.all(2.0),
// //                       child: InkWell(
// //                         child: tile.croppedImageTile(),
// //                         onTap: () {
// //                           print("tapped on tile");
// //                         },
// //                       ),
// //                     ),
// //                   )
// //                   .toList(),
// //             ),
// //           ),
// //           Slider(
// //             value: _divisions.toDouble(),
// //             min: 3,
// //             max: 8,
// //             divisions: 3,
// //             label: _divisions.toString(),
// //             onChanged: (value) {
// //               setState(() {
// //                 _divisions = value.toInt();
// //                 tiles = List.generate(
// //                   _divisions * _divisions,
// //                   (index) => Tile(
// //                     imageURL: 'assets/images/paris.jpg',
// //                     alignment: Alignment(
// //                       -1.0 + (2.0 / (_divisions - 1)) * (index % _divisions),
// //                       -1.0 + (2.0 / (_divisions - 1)) * (index ~/ _divisions),
// //                     ),
// //                   ),
// //                 );
// //               });
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'dart:ui';

// class Tile {
//   final String imageURL;
//   final Alignment alignment;

//   const Tile({required this.imageURL, required this.alignment});

//   Widget createTapableCroppedImageTiles() {
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

//   // List<Widget> createTapableCroppedImageTiles() {
//   //   return [
//   //     [-1, -1],
//   //     [0, -1],
//   //     [1, -1],
//   //     [-1, 0],
//   //     [0, 0],
//   //     [1, 0],
//   //     [-1, 1],
//   //     [0, 1],
//   //     [1, 1],
//   //   ]
//   //       .map((coords) =>
//   //           createCroppedImageTile(coords[0].toDouble(), coords[1].toDouble()))
//   //       .toList();
//   // }

//   Widget createCroppedImageTile(double x, double y) {
//     return InkWell(
//       child: FittedBox(
//           fit: BoxFit.fill,
//           child: ClipRect(
//             child: Container(
//                 child: Align(
//               alignment: Alignment(x, y),
//               widthFactor: 0.33,
//               heightFactor: 0.33,
//               child: Image.asset("assets/images/paris.jpg"),
//             )),
//           )),
//       onTap: () {
//         print('tapped on tile' + x.toString() + "" + y.toString());
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Tile Grid View'),
//         ),
//         body: Column(children: [
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
//                         child: tile.createTapableCroppedImageTiles(),
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
//         ]));
//   }
// }

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
          )
        ],
      ),
    );
  }
}
