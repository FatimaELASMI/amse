import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

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
  Timer? _timer;

  void startAnimation() {
    _timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
      setState(() {
        if (_currentRotateXValue == 2 * pi) {
          _currentRotateXValue = 0;
        } else {
          _currentRotateXValue += pi / 4;
        }

        if (_currentRotateZValue == 2 * pi) {
          _currentRotateZValue = 0;
        } else {
          _currentRotateZValue += pi / 4;
        }

        if (_currentScaleValue == 2) {
          _currentScaleValue = 0;
        } else {
          _currentScaleValue += 0.25;
        }
      });
    });
  }

  void stopAnimation() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isAnimating = !isAnimating;
                    if (isAnimating) {
                      startAnimation();
                    } else {
                      stopAnimation();
                    }
                  });
                },
                child: Text(isAnimating ? 'Stop' : 'Start'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
