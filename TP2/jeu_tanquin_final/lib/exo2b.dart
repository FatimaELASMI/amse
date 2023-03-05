import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'exo2a.dart' as exo2a;
import 'exo4.dart' as exo4;

class DisplayImageWidget extends StatefulWidget {
  const DisplayImageWidget({Key? key}) : super(key: key);

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
  void initState() {
    super.initState();
    _currentRotateXValue = 0;
    _currentRotateZValue = 0;
    _currentScaleValue = 100;
    isChecked = false;
    isAnimating = false;
  }

  void animateRotationX(Timer t) {
    if (isAnimating == true) {
      setState(() {
        if (_currentRotateXValue < 180) {
          _currentRotateXValue++;
        } else {
          _currentRotateXValue = 0;
          animateRotationX(t);
        }
      });
    } else {
      t.cancel();
    }
  }

  void animateRotationZ(Timer t) {
    if (isAnimating == true) {
      setState(() {
        if (_currentRotateZValue < 180) {
          _currentRotateZValue++;
        } else {
          _currentRotateZValue = 0;
          animateRotationZ(t);
        }
      });
    } else {
      t.cancel();
    }
  }

  void animateScaleValue(Timer t) {
    if (isAnimating == true) {
      setState(() {
        if (_currentScaleValue > 0) {
          _currentScaleValue--;
        } else {
          _currentScaleValue = 100;
          animateScaleValue(t);
        }
      });
    } else {
      t.cancel();
    }
  }

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
              transform: Matrix4(
                1,
                0,
                0,
                0,
                0,
                1,
                0,
                0,
                0,
                0,
                1,
                0,
                0,
                0,
                0,
                1,
              )
                ..rotateX(pi / 180 * _currentRotateXValue)
                ..rotateY(isChecked ? pi : 0)
                ..rotateZ(pi / 180 * _currentRotateZValue)
                ..scale(_currentScaleValue / 100),
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
                max: 180,
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
                max: 180,
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
                onChanged: (value) {
                  setState(() {
                    isChecked = !isChecked;
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
                min: 0,
                max: 100,
                onChanged: (double value) {
                  setState(() {
                    _currentScaleValue = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      isAnimating = !isAnimating;
                      Duration d1 = Duration(milliseconds: 20);
                      Duration d2 = Duration(milliseconds: 30);
                      Duration d3 = Duration(milliseconds: 10);
                      if (isAnimating == true) {
                        Timer.periodic(d1, animateRotationX);
                        Timer.periodic(d2, animateRotationZ);
                        Timer.periodic(d3, animateScaleValue);
                      }
                    });
                  },
                  child: Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Text(
                      isAnimating ? 'Stop' : 'Start',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
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
                              builder: (context) => exo2a.DisplayImageWidget(),
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
                            builder: (context) => exo4.DisplayTileWidget(),
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
