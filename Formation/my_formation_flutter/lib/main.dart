import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
      home: Home(),

    ));
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  Scaffold(
        appBar: AppBar(
          title: Text("media app"),
          centerTitle: true,
          backgroundColor: Colors.red[900],
        ),
        body:Center(
          child: Image.asset( '/image3.jpg'),

        ),
      );
  }
}

