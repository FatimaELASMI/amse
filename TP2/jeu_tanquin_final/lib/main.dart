import 'package:flutter/material.dart';
import 'exo1.dart' as exo1;
import 'exo2a.dart' as exo2a;
import 'exo2b.dart' as exo2b;
import 'exo4.dart' as exo4;
import 'exo5a.dart' as exo5a;
import 'exo5b.dart' as exo5b;
import 'exo5c.dart' as exo5c;
import 'exo6a.dart' as exo6a;
import 'exo6b.dart' as exo6b;
import 'exo6c.dart' as exo6c;
import 'exo7.dart' as exo7;
import 'exo7a.dart' as exo7a;
import 'exo8.dart' as exo8;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MenuPage());
  }
}

class Exo {
  final String title;
  final String? subtitle;
  final WidgetBuilder buildFunc;

  const Exo({required this.title, this.subtitle, required this.buildFunc});
}

List exos = [
  Exo(
      title: 'Exercice 1',
      subtitle: 'Display a image',
      buildFunc: (context) => exo1.ImageWidget()),
  Exo(
      title: 'Exercice 2',
      subtitle: 'Animated Rotate & Scale Image',
      buildFunc: (context) => exo2a.DisplayImageWidget()),
  Exo(
      title: 'Exercice 2b',
      subtitle: 'Animated Rotate & Scale Image',
      buildFunc: (context) => exo2b.DisplayImageWidget()),
  Exo(
      title: 'Exercice 4',
      subtitle: 'Display a Tile',
      buildFunc: (context) => exo4.DisplayTileWidget()),
  Exo(
      title: 'Exercice 5a',
      subtitle: 'Grid of colored boxes',
      buildFunc: (context) => exo5a.DisplayGridView()),
  Exo(
      title: 'Exercice 5b',
      subtitle: 'Fixed Grid of CroppedImage',
      buildFunc: (context) => exo5b.DisplayGridView()),
  Exo(
      title: 'Exercice 5c',
      subtitle: 'Configurable Taquin Board ',
      buildFunc: (context) => exo5c.DisplayImageWidget()),
  Exo(
      title: 'Exercice 6a',
      subtitle: 'Moving Tiles ',
      buildFunc: (context) => exo6a.PositionedTiles()),
  Exo(
      title: 'Exercice 6b',
      subtitle: 'Moving Tiles in Grid',
      buildFunc: (context) => exo6b.DisplayGridView()),
  Exo(
      title: 'Exercice 6c',
      subtitle: 'Moving & Changing  Tiles size in Grid',
      buildFunc: (context) => exo6c.DisplayGridView()),
  Exo(
      title: 'Exercice 7',
      subtitle: 'Tanquin Game',
      buildFunc: (context) => exo7.DisplayGridView()),
];

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TP2'),
        ),
        body: ListView.builder(
            itemCount: exos.length,
            itemBuilder: (context, index) {
              var exo = exos[index];
              return Card(
                  child: ListTile(
                      title: Text(exo.title),
                      subtitle: Text(exo.subtitle),
                      trailing: Icon(Icons.play_arrow_rounded),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: exo.buildFunc),
                        );
                      }));
            }));
  }
}
