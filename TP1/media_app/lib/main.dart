import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'navBar.dart' as navBar;
import 'profilePage.dart' as profile;
import 'favoritePage.dart' as favorite;

void main() {
  runApp(const MyApp());
}

// ajout du navbar contenant Home, media, about, likes and profile

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
  List<bool> _favorites = [ false,   false,  false,    false,    false,    false,    false,false,false,false,false,false  ];
  

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
      _favorites[index] = !_favorites[index];
    });
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: 
       Container(
        color: Colors.black,
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:15.0,vertical:20),
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor:Colors.grey.shade800,
          gap:8,
          onTabChange:(index){
            switch(index){
              case 0: 
              print("Homepage");
              break;
               case 1: 
             Navigator.push(context,MaterialPageRoute(builder:(context)=>profile.ProfilePage()));
            
              break;
              case 2:
              print("media");
              break;
              case 3:
              // Navigator.push(context,MaterialPageRoute(builder:(context)=>favorite.FavoritePage()));
                print('hi');
              break;
            }

           }
          ,
          padding:EdgeInsets.all(16),
          tabs:const[
          GButton(icon: Icons.home,text:'Home'),
          GButton(icon: Icons.favorite_border, text: 'Favorite'),
          GButton(icon: LineIcons.video, text:'Media',),
          GButton(icon: LineIcons.user, text:'Profile'),
        ]
      )
      )
      ),
      
      
      // body: Padding(
      //   padding: const EdgeInsets.all(25),
      //   child: Column(
      //     children: [
      //       // Display the data loaded from media.json
      //       _items.isNotEmpty
      //           ? Expanded(
      //               // child: ListView.builder(
      //               //   itemCount: _items.length,
      //               //   itemBuilder: (context, index) {
      //               //     return Card(
      //               //       key: ValueKey(_items[index]["id"]),
      //               //       margin: const EdgeInsets.all(10),
      //               //       color: Colors.amber.shade100,
      //               //       child: ListTile(
      //               //         leading: Image.network(_items[index]["image"]),
      //               //         title: Text(_items[index]["title"]),
                            
      //               //       ),
      //               //     );
      //               //   },
      //               // ),
      //               )
      //             )
      //           : Container()
      //     ],
      //   ),

body: Container(
  child:GridView.builder(
    itemCount:12,
    itemBuilder:(context,index){
       return Card(
       elevation: 0.0,
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
       child: Column(
         children: [
           Text(
            _items[index]["title"],
           ),
            Container(
             height: 200.0,
             child: Image.network(
               _items[index]["image"] ,
               fit: BoxFit.cover,
             ),
           ),
           ButtonBar(
             children: [
               TextButton(
                 child: const Text('LEARN MORE'),
                 onPressed: () {/* ... */},
               ),
             IconButton(
              icon: Icon(
                _favorites[index] ? Icons.favorite : Icons.favorite_border,
                color: _favorites[index] ? Colors.red : null,
              ),
              onPressed: () => _toggleFavorite(index),
            ),
             ],
           )
         ],
       ));

      // return Card(
      //                    elevation:10,
      //                     margin: const EdgeInsets.all(10),
      //                    child: ListTile(
      //                       subtitle: Image.network(_items[index]["image"], fit: BoxFit.cover,
      //             height: 200.0,),
      //                       title: Text(_items[index]["title"],style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold)),  
      //                     ),
                        
      //                     );
                         
   
    },
    gridDelegate:
    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3)
  )
)
      );
    
  }



}