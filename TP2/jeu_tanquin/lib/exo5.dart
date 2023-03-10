
import 'package:flutter/material.dart';
import 'dart:ui';


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
// partie 1 : les portions sont des simples containers

      // body: GridView.count(
      //   padding: const EdgeInsets.all(20),
      //    crossAxisSpacing: 4,
      //       mainAxisSpacing: 4,
      //   crossAxisCount: 3, 
      //   children: List.generate(
      //     9, 
      //     (index) => Container(
      //       padding: const EdgeInsets.all(8),
      //       margin: EdgeInsets.all(2.0), // marge autour de la tuile
      //       color: Colors.blueGrey, // couleur de fond de la tuile
      //       child: Center(
      //         child: Text(
      //           'Tile ${index + 1}', 
      //           style: TextStyle(
      //             color: Colors.white, 
      //             fontSize: 24.0, 
      //             fontWeight: FontWeight.bold, 
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

body:GridView.builder(
  itemCount: 9,
  gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
  itemBuilder: (BuildContext context, int index) {
    return Image.asset(
      'assets/images/paris.jpg',
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 3,
      alignment: Alignment.topLeft,
      clipRect: Rect.fromLTWH(
        index % 3 * (MediaQuery.of(context).size.width / 3),
        (index / 3).floor() * (MediaQuery.of(context).size.height / 3),
        MediaQuery.of(context).size.width / 3,
        MediaQuery.of(context).size.height / 3,
      ),
    );
  },
),




    );
  }
}

