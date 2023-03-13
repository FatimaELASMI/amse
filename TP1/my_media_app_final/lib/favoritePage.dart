// // import 'package:flutter/material.dart';
// // import 'main.dart' as Home;

// // class FavoriteListScreen extends StatefulWidget {
// //   final List favorites;

// //   FavoriteListScreen({required this.favorites});

// //   @override
// //   _FavoriteListScreenState createState() => _FavoriteListScreenState();
// // }

// // class _FavoriteListScreenState extends State<FavoriteListScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('My Favorite List',
// //             style: TextStyle(
// //               color: Colors.white,
// //             )),
// //         backgroundColor: Colors.black,
// //         centerTitle: true,
// //       ),
// //       bottomNavigationBar: Home.NavBarBottom(),
// //       body: ListView.builder(
// //         itemCount: widget.favorites.length,
// //         itemBuilder: (BuildContext context, int index) {
// //           var item = widget.favorites[index];
// //           return ListTile(
// //             leading: Image.network(item['image']),
// //             title: Text(item['title']),
// //             trailing: IconButton(
// //               icon: Icon(Icons.delete),
// //               onPressed: () {
// //                 setState(() {
// //                   widget.favorites.remove(item);
// //                 });
// //               },
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'main.dart' as Home;

// class FavoriteListScreen extends StatefulWidget {
//   final List favorites;

//   FavoriteListScreen({required this.favorites});

//   @override
//   _FavoriteListScreenState createState() => _FavoriteListScreenState();
// }

// class _FavoriteListScreenState extends State<FavoriteListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Favorite List',
//             style: TextStyle(
//               color: Colors.white,
//             )),
//         backgroundColor: Colors.black,
//         centerTitle: true,
//       ),
//       bottomNavigationBar: Home.NavBarBottom(),
//       body: ListView.builder(
//         itemCount: widget.favorites.length,
//         itemBuilder: (BuildContext context, int index) {
//           var item = widget.favorites[index];
//           return Card(
//             child: Column(
//               children: [
//                 ListTile(
//                   leading: Image.network(
//                     item['image'],
//                     height: 200,
//                   ),
//                   title: Text(item['title'],
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//                   subtitle: Text(item['plot'], style: TextStyle(fontSize: 17)),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.delete),
//                       onPressed: () {
//                         setState(() {
//                           widget.favorites.remove(item);
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'main.dart' as Home;

class FavoriteListScreen extends StatefulWidget {
  final List favorites;

  FavoriteListScreen({required this.favorites});

  @override
  _FavoriteListScreenState createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite List',
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      bottomNavigationBar: Home.NavBarBottom(),
      body: ListView.builder(
        itemCount: widget.favorites.length,
        itemBuilder: (BuildContext context, int index) {
          var item = widget.favorites[index];
          return Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 200,
                  alignment: Alignment.center,
                  child: Image.network(
                    item['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        item['plot'],
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.favorites.remove(item);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
