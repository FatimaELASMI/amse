import 'package:flutter/material.dart';
import 'dart:math';
import 'exo2a.dart' as exo2a;

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Afficher une image'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assets/images/flutter.png',
                width: 350,
                fit: BoxFit.fill,
              ),
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
                          Navigator.pop(context);
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
                              builder: (context) => exo2a.DisplayImageWidget(),
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
        ));
  }
}
