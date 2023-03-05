import 'package:flutter/material.dart';
import 'dart:math';
import 'exo2b.dart' as exo2b;
import 'exo1.dart' as exo1;

class DisplayImageWidget extends StatefulWidget {
  const DisplayImageWidget({super.key});

  @override
  State<DisplayImageWidget> createState() => _DisplayImageWidgetState();
}

class _DisplayImageWidgetState extends State<DisplayImageWidget> {
  double _currentRotateXValue = 0;
  double _currentRotateZValue = 0;
  double _currentScaleValue = 1;
  bool isChecked = false;
  bool isAnimating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exo 2 : Animated Rotate & Scale Image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(color: Colors.white),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateX(_currentRotateXValue)
                ..rotateZ(_currentRotateZValue)
                ..rotateY(isChecked ? -pi : 0)
                ..scale(_currentScaleValue),
              child: Image.asset(
                'assets/images/paris.jpg',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('RotateX:'),
              Slider(
                value: _currentRotateXValue,
                max: 2 * pi,
                onChanged: (double value) {
                  setState(() {
                    _currentRotateXValue = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('RotateZ:'),
              Slider(
                value: _currentRotateZValue,
                max: 2 * pi,
                onChanged: (double value) {
                  setState(() {
                    _currentRotateZValue = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Mirror:'),
              Checkbox(
                checkColor: Colors.white,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Scale:'),
              Slider(
                value: _currentScaleValue,
                max: 2,
                onChanged: (double value) {
                  setState(() {
                    _currentScaleValue = value;
                  });
                },
              ),
            ],
          ),
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
                              builder: (context) => exo1.ImageWidget(),
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
                            builder: (context) => exo2b.DisplayImageWidget(),
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
              ))
        ],
      ),
    );
  }
}
