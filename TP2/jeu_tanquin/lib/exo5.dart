import 'package:flutter/material.dart';

class DisplayGridView extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Afficher une image'),
        ),
        body: Container(
            child:GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 4,
  mainAxisSpacing: 4,
  crossAxisCount: 3,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.lightBlue[800],
      child: const Text("Tile 1"),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.tealAccent[400],
      child: const Text('Tile 2'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.greenAccent[400],
      child: const Text('Tile 3'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.purpleAccent[100],
      child: const Text('Tile 4'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.deepPurple[600],
      child: const Text('Tile 5'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.lightBlue,
      child: const Text('Tile 6'),
    ),
      Container(
      padding: const EdgeInsets.all(8),
      color: Colors.red,
      child: const Text('Tile 7'),
    ),
      Container(
      padding: const EdgeInsets.all(8),
      color: Colors.greenAccent,
      child: const Text('Tile 8'),
    ),
      Container(
      padding: const EdgeInsets.all(8),
      color: Colors.blueAccent[700],
      child: const Text('Tile 9'),
    ),
  ],
)
        )
    );
}
}
