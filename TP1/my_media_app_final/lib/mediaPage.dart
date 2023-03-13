// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';

// import 'profilePage.dart' as profile;
// import 'favoritePage.dart' as favorite;
// import 'mediaPage.dart' as media;

// import 'main.dart' as Home;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({
//     Key? key,
//   }) : super(key: key);
//   @override
//   MediaApp createState() => MediaApp();
// }

// class MediaApp extends State<MyApp> {
//   final List favorites = [];
//   List _items = [];
//   List<String> _genres = [
//     'All',
//     'Action',
//     'Comedy',
//     ' Adventure',
//     'Drama',
//     'Horror',
//     'Fantasy'
//   ];
//   String _selectedGenre = 'All';
//   // Fetch content from the json file
//   Future<void> readJson() async {
//     final String response = await rootBundle.loadString('media.json');
//     final data = await json.decode(response);
//     setState(() {
//       _items = data["items"];
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Call the readJson method when the app starts
//     readJson();
//   }

//   List _filteredItems() {
//     if (_selectedGenre == 'All') {
//       return _items;
//     } else {
//       return _items.where((item) => item['genres'] == _selectedGenre).toList();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'media ',
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           title: Text('My Media',
//               style: TextStyle(
//                 color: Colors.white,
//               )),
//           backgroundColor: Colors.black,
//           centerTitle: true,
//           actions: [
//             DropdownButton<String>(
//               value: _selectedGenre,
//               dropdownColor: Colors.black,
//               style: TextStyle(color: Colors.white),
//               items: _genres.map((String genre) {
//                 return DropdownMenuItem<String>(
//                   value: genre,
//                   child: Text(genre),
//                 );
//               }).toList(),
//               onChanged: (String? value) {
//                 setState(() {
//                   _selectedGenre = value ?? 'All';
//                 });
//               },
//             ),
//           ],
//         ),
//         bottomNavigationBar: Home.NavBarBottom(),
//         body: GridView.builder(
//           itemCount: _filteredItems().length,
//           padding: EdgeInsets.zero,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 0,
//             mainAxisSpacing: 0,
//           ),
//           itemBuilder: (BuildContext context, int index) {
//             return Column(children: [
//               Container(
//                   height: 150.0,
//                   child: Image.network(
//                     _filteredItems()[index]['image'],
//                     fit: BoxFit.fill,
//                   )),
//               Text(
//                 _filteredItems()[index]['title'],
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ]);
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'main.dart' as Home;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  MediaApp createState() => MediaApp();
}

class MediaApp extends State<MyApp> {
  final List favorites = [];
  List _items = [];
  List<String> _genres = [
    'All',
    'Action',
    'Comedy',
    'Adventure',
    'Drama',
    'Horror',
    'Fantasy'
  ];
  String _selectedGenre = 'All';

// Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('media.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
// Call the readJson method when the app starts
    readJson();
  }

  List _filteredItems() {
    if (_selectedGenre == 'All') {
      return _items;
    } else {
      return _items.where((item) => item['genres'] == _selectedGenre).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'media ',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('My Media',
              style: TextStyle(
                color: Colors.white,
              )),
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: [
            DropdownButton<String>(
              value: _selectedGenre,
              dropdownColor: Colors.black,
              style: TextStyle(color: Colors.white),
              items: _genres.map((String genre) {
                return DropdownMenuItem<String>(
                  value: genre,
                  child: Text(genre),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _selectedGenre = value ?? 'All';
                });
              },
            ),
          ],
        ),
        bottomNavigationBar: Home.NavBarBottom(),
        body: GridView.builder(
          itemCount: _filteredItems().length,
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemBuilder: (BuildContext context, int index) {
            var item = _filteredItems()[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MediaDetailScreen(item: item),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                      height: 150.0,
                      child: Image.network(
                        item['image'],
                        fit: BoxFit.fill,
                      )),
                  Text(
                    item['title'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class MediaDetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const MediaDetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          item['title'],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                item['image'],
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Genres: ${item['genres']}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Plot:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    item['plot'],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
