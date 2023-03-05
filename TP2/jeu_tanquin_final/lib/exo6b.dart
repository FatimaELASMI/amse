import 'package:flutter/material.dart';
import 'exo6a.dart' as exo6a;
import 'exo6c.dart' as exo6c;

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
        style: const TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}

class DisplayGridView extends StatefulWidget {
  @override
  DisplayGridViewState createState() => DisplayGridViewState();
}

class DisplayGridViewState extends State<DisplayGridView> {
  static int EmptyIndex = 0;
  List<Widget>? _items;

  @override
  void initState() {
    super.initState();
    _items = List.generate(16, (index) => TileWidget(Tile(index)));
  }

  bool _ChangeIndex(int index) {
    return ((EmptyIndex != index) &&
        (((EmptyIndex % 4 != 0) && (index + 1 == EmptyIndex)) ||
            (((EmptyIndex + 1) % 4 != 0) && (index - 1 == EmptyIndex)) ||
            (((EmptyIndex + 4 >= 0) && (index + 4 == EmptyIndex))) ||
            (((EmptyIndex + 4 < 16) && (index - 4 == EmptyIndex)))));
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
                      height: 480,
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 2,
                        crossAxisCount: 4,
                        children: List.generate(
                            16,
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
                                  builder: (context) => exo6a.PositionedTiles(),
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
                                builder: (context) => exo6c.DisplayGridView(),
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
