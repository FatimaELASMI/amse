import 'package:flutter/material.dart';
import 'dart:ui';
import 'exo5a.dart' as exo5a;
import 'exo5c.dart' as exo5c;

class DisplayGridView extends StatelessWidget {
  List<Widget> _generateTiles() {
    return [
      [-1, -1],
      [0, -1],
      [1, -1],
      [-1, 0],
      [0, 0],
      [1, 0],
      [-1, 1],
      [0, 1],
      [1, 1],
    ]
        .map((coords) =>
            croppedImageTile(coords[0].toDouble(), coords[1].toDouble()))
        .toList();
  }

  Widget croppedImageTile(double x, double y) {
    return InkWell(
      child: FittedBox(
          fit: BoxFit.fill,
          child: ClipRect(
            child: Container(
                child: Align(
              alignment: Alignment(x, y),
              widthFactor: 0.33,
              heightFactor: 0.33,
              child: Image.asset("assets/images/paris.jpg"),
            )),
          )),
      onTap: () {
        print('tapped on tile' + x.toString() + "" + y.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tile Grid View'),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                crossAxisCount: 3,
                children: this._generateTiles(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
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
                            builder: (context) => exo5a.DisplayGridView(),
                          ),
                        );
                      },
                      elevation: 2.0,
                      fillColor: Colors.blue,
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
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
                          builder: (context) => exo5c.DisplayImageWidget(),
                        ),
                      );
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
            ),
          ],
        ));
  }
}
