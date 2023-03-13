import 'dart:math';
import 'package:flutter/material.dart';
import 'main.dart';
import 'exo6c.dart' as exo6c;
import 'main.dart' as Home;

Random random = new Random();

class Tile {
  String imagePath;
  Alignment alignment;

  Tile({required this.imagePath, required this.alignment});

  Widget croppedImageTile(double gridSize) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 1 / gridSize,
            heightFactor: 1 / gridSize,
            child: Image.asset(this.imagePath),
          ),
        ),
      ),
    );
  }
}

class DisplayGridView extends StatefulWidget {
  @override
  DisplayGridViewState createState() => DisplayGridViewState();
}

class DisplayGridViewState extends State<DisplayGridView> {
  String imagePath = 'assets/images/paris.jpg';
  double gridSize = 4;
  static int EmptyIndex = 1;
  List<Widget> _tiles = <Widget>[];
  bool started = false;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    gridSize = 3;
    started = false;
    counter = 0;
  }

  bool _ChangeIndex(int index) {
    return ((EmptyIndex != index) &&
        (((EmptyIndex % gridSize != 0) && (index + 1 == EmptyIndex)) ||
            (((EmptyIndex + 1) % gridSize != 0) && (index - 1 == EmptyIndex)) ||
            (((EmptyIndex + gridSize >= 0) &&
                (index + gridSize == EmptyIndex))) ||
            (((EmptyIndex + gridSize < pow(gridSize, 2)) &&
                (index - gridSize == EmptyIndex)))));
  }

  List<Widget> _generateTiles() {
    _tiles = <Widget>[];
    for (int i = 0; i < gridSize * gridSize; i++) {
      double x = (i % gridSize) * (2 / (gridSize - 1)) - 1;
      double y = (i ~/ gridSize) * (2 / (gridSize - 1)) - 1;
      _tiles.add(new Tile(imagePath: imagePath, alignment: Alignment(x, y))
          .croppedImageTile(gridSize));
    }
    return _tiles;
  }

  void _pickImage() async {
    final _imagePath = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ImagePicker(),
      ),
    );
    setState(() {
      imagePath = _imagePath;
      _generateTiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    _generateTiles();

    return Scaffold(
        appBar: AppBar(
          title: Text('Taquin Board '),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            children: [
              Text(
                "Choose an image :  ",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  _pickImage();
                  setState(() {
                    _generateTiles();
                  });
                },
                child: Image.asset(
                  imagePath,
                  width: 80,
                  height: 80,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
              child: GridView.count(
            primary: false,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            crossAxisCount: gridSize.toInt(),
            children: List.generate(
                pow(gridSize, 2).toInt(),
                (index) => InkWell(
                    child: Container(
                      child: index == EmptyIndex ? null : _tiles[index],
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: EmptyIndex == null || started == false
                                  ? Colors.transparent
                                  : _ChangeIndex(index)
                                      ? Colors.red
                                      : Colors.transparent,
                              width: 2)),
                    ),
                    onTap: () {
                      setState(() {
                        if (_ChangeIndex(index)) {
                          swapTiles(index);
                        }
                      });
                    })),
          )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            RawMaterialButton(
                onPressed: started
                    ? null
                    : () {
                        setState(() {
                          if (gridSize > 3) {
                            gridSize--;
                          }
                        });
                      },
                elevation: 2.0,
                fillColor: Colors.blue,
                child: Icon(
                  Icons.horizontal_rule,
                  size: 15.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
            RawMaterialButton(
              onPressed: () => {
                setState(() {
                  started = !started;

                  counter++;
                  if (counter <= 1) {
                    EmptyIndex = random.nextInt(pow(gridSize, 2).toInt() - 1);
                  }
                })
              },
              elevation: 2.0,
              fillColor: Colors.blue,
              child: Text(
                started ? 'Stop' : 'Start',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.all(20.0),
              shape: CircleBorder(),
            ),
            RawMaterialButton(
                onPressed: started
                    ? null
                    : () {
                        setState(() {
                          if (gridSize < 10) {
                            gridSize++;
                          }
                        });
                      },
                elevation: 2.0,
                fillColor: Colors.blue,
                child: Icon(
                  Icons.add,
                  size: 15.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
          ]),
          Padding(
              padding: const EdgeInsets.only(top: 100.0),
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
                              builder: (context) => exo6c.DisplayGridView(),
                            ));
                      },
                      elevation: 2.0,
                      fillColor: Colors.blue,
                      child: Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20.0,
                            color: Colors.white,
                          )),
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
                            builder: (context) => Home.MyApp(),
                          ));
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
              )),
          SizedBox(
            height: 40,
          )
        ]));
  }

  void swapTiles(int index) {
    var tempValue;

    tempValue = _tiles[EmptyIndex];

    _tiles[EmptyIndex] = _tiles[index];
    EmptyIndex = index;
    _tiles[index] = tempValue;
  }
}

class ImagePicker extends StatelessWidget {
  final List<String> imagePaths = [
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
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop(imagePaths[index]);
            },
            child: Image.asset(
              imagePaths[index],
              width: 100,
              height: 100,
            ),
          );
        },
      ),
    );
  }
}
