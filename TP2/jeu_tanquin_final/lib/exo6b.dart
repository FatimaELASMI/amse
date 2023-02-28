import 'package:flutter/material.dart';
import 'dart:ui';

class DisplayGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DisplayGridViewState();
}

class DisplayGridViewState extends State<DisplayGridView> {
  final List<String> _items =
      List.generate(16, (index) => index == 0 ? '' : index.toString());
  _changeIndex(int i) {
    int _emptyIndex = _items.lastIndexOf('');
    int _previousItem = i - 1;
    int _nextItem = i + 1;
    int _previousRow = i - 4;
    int _nextRow = i + 4;
    if (_emptyIndex == _previousItem) {
      _items[_previousItem] = _items[i];
      _items[i] = '';
    } else if (_emptyIndex == _nextItem) {
      _items[_nextItem] = _items[i];
      _items[i] = '';
    } else if (_emptyIndex == _previousRow) {
      _items[_previousRow] = _items[i];
      _items[i] = '';
    } else if (_emptyIndex == _nextRow) {
      _items[_nextRow] = _items[i];
      _items[i] = '';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Swapable Color grid widget'),
        ),
        body: Center(
            child: AspectRatio(
          aspectRatio: 1,
          child: GridView.count(
            crossAxisCount: 4,
            children: [
              for (int i = 0; i < 16; i++)
                InkWell(
                    onTap: () {
                      _changeIndex(i);
                    },
                    child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: _items[i].isEmpty
                              ? Colors.white
                              : Color.fromARGB(255, 153, 161, 168),
                        ),
                        child: Center(
                          child: Text(
                            _items[i].isEmpty ? 'empty 0' : 'Tile ${_items[i]}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                        ))),
            ],
          ),
        )));
  }
}
