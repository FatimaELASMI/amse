import 'package:flutter/material.dart';

class DisplayGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DisplayGridViewState();
}

class DisplayGridViewState extends State<DisplayGridView> {
  int _gridSize = 3;
  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _generateItems();
  }

  void _generateItems() {
    _items.clear();
    int totalItems = _gridSize * _gridSize;
    for (int i = 0; i < totalItems; i++) {
      _items.add(i == 0 ? '' : i.toString());
    }
  }

  void _changeIndex(int i) {
    int _emptyIndex = _items.lastIndexOf('');
    int _previousItem = i - 1;
    int _nextItem = i + 1;
    int _previousRow = i - _gridSize;
    int _nextRow = i + _gridSize;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: GridView.count(
                crossAxisCount: _gridSize,
                children: [
                  for (int i = 0; i < _items.length; i++)
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
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Size'),
                const SizedBox(width: 20),
                Expanded(
                  child: Slider(
                    min: 3,
                    max: 8,
                    divisions: 6,
                    value: _gridSize.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        _gridSize = value.toInt();
                        _generateItems();
                      });
                    },
                  ),
                ),
                Text('$_gridSize x $_gridSize'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}