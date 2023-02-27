import 'package:flutter/material.dart';
import 'exo1.dart' as exo1;
import 'exo2a.dart' as exo2a;
import 'exo4.dart' as exo4;
import 'exo5a.dart' as exo5a;
import 'exo5b.dart' as exo5b;
import 'exo5c.dart' as exo5c;

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
      subtitle: 'Afficher une image',
      buildFunc: (context) => exo1.ImageWidget()),
  Exo(
      title: 'Exercice 2',
      subtitle: 'Animated Rotate & Scale Image',
      buildFunc: (context) => exo2a.DisplayImageWidget()),
  Exo(
      title: 'Exercice 4',
      subtitle: 'Afficher une tuile',
      buildFunc: (context) => exo4.DisplayTileWidget()),
  Exo(
      title: 'Exercice 5',
      subtitle: 'Grid of colored boxes',
      buildFunc: (context) => exo5a.DisplayGridView()),
  Exo(
      title: 'Exercice 5b',
      subtitle: 'Fixed Grid of CroppedImage',
      buildFunc: (context) => exo5b.DisplayGridView()),
  Exo(
      title: 'Exercice 5c',
      subtitle: 'Configurable Taquin Board ',
      buildFunc: (context) => exo5c.DisplayGridView()),
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