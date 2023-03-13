import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'profilePage.dart' as profile;
import 'favoritePage.dart' as favorite;
import 'mediaPage.dart' as media;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'media App',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _items = [];
  static List _favorites = [];

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

  void _toggleFavorite(int index) {
    setState(() {
      var item = _items[index];
      bool isExist = _favorites.any((element) => element['id'] == item['id']);

      if (isExist) {
        item["isLiked"] = false;
        _favorites.removeWhere((element) => element['id'] == item['id']);
      } else {
        item["isLiked"] = true;
        _favorites.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        // ----------AppBar ---------------
        appBar: AppBar(
          title: Text('Media',
              style: TextStyle(
                color: Colors.white,
              )),
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Perform search action here
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                // Perform settings action here
              },
            ),
          ],
        ),
// -----------Fin AppBar---------

        // --------------Bottom navigation Bar----------------
        bottomNavigationBar: NavBarBottom(),

// ----------Fin bottom navigation Bar --------------

// -------------------------------Body ------------------------------
        body: Column(
          children: [
            Image.network(
              'https://m.media-amazon.com/images/M/MV5BMWE4OWE0NmMtYjlmOC00NGE1LWJiNDItNDgxNzVjYzViMGQ3XkEyXkFqcGdeQXVyNTgyNTA4MjM@._V1_Ratio0.6837_AL_.jpg',
              width: 400,
              height: 240,
              fit: BoxFit.fill,
            ),
            Wrap(children: [
              Row(children: [
                Container(
                  width: 80,
                  height: 28,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Action',
                        style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.amber[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                ),
                Text('/Horror/crime',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ]),
              Text(
                'Thorfinn pursues a journey with his fathers killer in order to take revenge and end his life in a duel as an honorable warrior and pay his father a homage.',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ]),
            Text(
              'Watch Movies',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Expanded(
              child: _items.isNotEmpty
                  ? GridView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        var item = _items[index];
                        return Card(
                            color: Colors.black,
                            elevation: 0.0,
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Column(
                              children: [
                                Text(_items[index]["title"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                Stack(
                                  children: [
                                    Image.network(
                                      _items[index]["image"],
                                      fit: BoxFit.cover,
                                      height: 280.0,
                                    ),
                                    Positioned.fill(
                                        child: Align(
                                            alignment: Alignment.center,
                                            // child: IconButton(
                                            //     icon: Icon(
                                            //       _favorites.any((item) =>
                                            //               item['id'] ==
                                            //               _items[index]['id'])
                                            //           ? Icons.favorite
                                            //           : Icons.favorite_border,
                                            //       color: _favorites.any((item) =>
                                            //               item['id'] ==
                                            //               _items[index]['id'])
                                            //           ? Colors.red
                                            //           : null,
                                            //     ),
                                            //     onPressed: () => {
                                            //           this._toggleFavorite(index),
                                            //         }),
                                            // child: IconButton(
                                            //         icon: Icon(
                                            //           _favorites.any((item) =>
                                            //                   item['id'] ==
                                            //                   _items[index]['id'])
                                            //               ? Icons.favorite
                                            //               : Icons.favorite_border,
                                            //           color: _favorites.any((item) =>
                                            //                   item['id'] ==
                                            //                   _items[index]['id'])
                                            //               ? Colors.red
                                            //               : null,
                                            //         ),
                                            //         onPressed: () {
                                            //           _toggleFavorite(index);
                                            //         },
                                            //         color: Colors.white,
                                            //         elevation: _favorites.any((item) =>
                                            //                 item['id'] ==
                                            //                 _items[index]['id'])
                                            //             ? 5
                                            //             : 0,
                                            //       )
                                            child: Material(
                                              elevation: _favorites.any(
                                                      (item) =>
                                                          item['id'] ==
                                                          _items[index]['id'])
                                                  ? 5
                                                  : 0,
                                              child: IconButton(
                                                icon: Icon(
                                                  _favorites.any((item) =>
                                                          item['id'] ==
                                                          _items[index]['id'])
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: _favorites.any(
                                                          (item) =>
                                                              item['id'] ==
                                                              _items[index]
                                                                  ['id'])
                                                      ? Colors.red
                                                      : Colors.black,
                                                ),
                                                onPressed: () {
                                                  _toggleFavorite(index);
                                                },
                                                color: Colors.white,
                                              ),
                                            ))),
                                  ],
                                ),
                              ],
                            ));
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1))
                  : Center(child: CircularProgressIndicator()),
            ),
          ],
        ));
  }
}
//  Fiiiiiiiiiiiin Maiiiiiiiiiiiiin

class NavBarBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: GNav(
                backgroundColor: Colors.black,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.black,
                gap: 8,
                onTabChange: (index) {
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => favorite.FavoriteListScreen(
                                favorites: _HomePageState._favorites)),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => media.MyApp()),
                      );
                      break;
                    case 3:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => profile.ProfilePage()));

                      break;
                  }
                },
                padding: EdgeInsets.all(16),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                  ),
                  GButton(
                    icon: Icons.favorite_border,
                  ),
                  GButton(
                    icon: LineIcons.video,
                  ),
                  GButton(
                    icon: LineIcons.user,
                  ),
                ])));
  }
}
