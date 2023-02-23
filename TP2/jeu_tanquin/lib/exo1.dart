import 'package:flutter/material.dart';
import 'dart:math';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Afficher une image'),
        ),
        body: Center(
          child:
            Image.asset(
                'assets/images/flutter.png',
                width: 350,
                fit: BoxFit.fill,
                ),
        ));
  }
}
