import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';


class DisplayImageWidget extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transformer une image'),
        ),
        body:Transform(
          origin:Offset(100,100),
          transform: Matrix4.rotationZ(0.785),
          child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
          child: Image.asset(
                'assets/images/flutter.png',
                width: 350,
                height: 350,
                fit: BoxFit.cover,
                ),
        ),),
        )
    );
  }
}
