import 'dart:math';
import 'package:flutter/material.dart';
import 'exo6b.dart' as exo6b;
import 'exo7.dart' as exo7;

Random random = new Random();

class Tile {
  int number;

  Tile(this.number);
}

class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tile${tile.number}',
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }
}

class DisplayGridView extends StatefulWidget {
  @override
  DisplayGridViewState createState() => DisplayGridViewState();
}

class DisplayGridViewState extends State<DisplayGridView> {
  int gridSize = 4;
  static int EmptyIndex = 1;
  List<Widget>? _items;

  int counter = 0;

  @override
  void initState() {
    super.initState();
    gridSize = 4;
    _items = List.generate(100, (index) => TileWidget(Tile(index)));

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Swapable Color grid widget'),
        ),
        body: Material(
            type: MaterialType.transparency,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: 480, // constrain height
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 2,
                        crossAxisCount: gridSize,
                        children: List.generate(
                            pow(gridSize, 2).toInt(),
                            (index) => InkWell(
                                child: Container(
                                  child: _items![index],
                                  decoration: BoxDecoration(
                                      color: EmptyIndex == null
                                          ? Color.fromARGB(255, 153, 161, 168)
                                          : index == EmptyIndex
                                              ? Colors.white
                                              : Color.fromARGB(
                                                  255, 153, 161, 168),
                                      border: Border.all(
                                          color: EmptyIndex == null
                                              ? Colors.transparent
                                              : _ChangeIndex(index)
                                                  ? Colors.red
                                                  : Colors.transparent,
                                          width: 5)),
                                ),
                                onTap: () {
                                  swapTiles(index);
                                })),
                      )),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Size',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 20),
                      Expanded(
                          child: Slider(
                        value: gridSize.toDouble(),
                        min: 3,
                        max: 8,
                        onChanged: (newValue) {
                          setState(() {
                            gridSize = newValue.round();
                          });
                        },
                        divisions: 7,
                        label: gridSize.toString(),
                      ))
                    ],
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 100.0),
                        child: RawMaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => exo6b.DisplayGridView(),
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
                                builder: (context) => exo7.DisplayGridView(),
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
                  ),
                ])));
  }

  void swapTiles(int index) {
    var tempValue;
    setState(() {
      if (_ChangeIndex(index)) {
        tempValue = _items![EmptyIndex];

        _items![EmptyIndex] = _items![index];

        _items![index] = tempValue;
        EmptyIndex = index;
      }
    });
  }
}
