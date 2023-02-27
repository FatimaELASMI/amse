import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'navBar.dart' as navBar;
import 'profilePage.dart' as profile;
import 'favoritePage.dart' as favorite;
import 'mediaPage.dart' as media;
import 'homePage.dart' as homePage;

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
 List _items =[];
 List _favorites = [];



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

   void _toggleLike(int index) {
    setState(() {
      _items[index]["isLiked"] = !_items[index]["isLiked"];
    });
  }

  void _toggleFavorite(int index) {
    setState(() {
     var item = _items[index];
      if (_favorites.contains(item)) {
        _favorites.remove(item);
      } else {
        _favorites.add(item);
      }
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
         switch(index){
              case 0: 
                Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()), );
              break;
               case 1: 
                Navigator.push(context,MaterialPageRoute(builder: (context) => favorite.FavoriteListScreen(favorites: _favorites)), );
              break;
              case 2:
                Navigator.push(context,MaterialPageRoute(builder: (context) => media.MyApp()), );
              break;
              case 3:
             
                Navigator.push(context,MaterialPageRoute(builder:(context)=>profile.ProfilePage()));
               
              break;
            }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
     appBar: AppBar(
  title: Text('Media', style: TextStyle(color:Colors.amber[800],)),
   backgroundColor: Colors.black,
  centerTitle: true,
  actions: [
    IconButton(
      icon: Icon(Icons.search,color: Colors.amber),
      onPressed: () {
        // Perform search action here
      },
    ),
    IconButton(
      icon: Icon(Icons.settings,color: Colors.amber),
      onPressed: () {
        // Perform settings action here
      },
    ),
  ],
),




       bottomNavigationBar: 
         BottomNavigationBar(
           backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.amber),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border,color: Colors.amber),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.video,color: Colors.amber),
            label: 'Media',
          ),
            BottomNavigationBarItem(
            icon: Icon(LineIcons.user,color: Colors.amber),
            
            label: 'Profile',
          ),
       
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

      //  Container(
      //   color: Colors.black,
      //   child: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal:15.0,vertical:20),
      //   child: GNav(
      //     backgroundColor: Colors.black,
      //     color: Colors.white,
      //     activeColor: Colors.white,
      //     tabBackgroundColor:Colors.grey.shade800,
      //     gap:8,
      //     onTabChange:(index){
      //       switch(index){
      //         case 0: 
      //           Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()), );
      //         break;
      //          case 1: 
      //           Navigator.push(context,MaterialPageRoute(builder: (context) => favorite.FavoriteListScreen(favorites: _favorites)), );
      //         break;
      //         case 2:
      //           Navigator.push(context,MaterialPageRoute(builder: (context) => media.MyApp()), );
      //         break;
      //         case 3:
             
      //           Navigator.push(context,MaterialPageRoute(builder:(context)=>profile.ProfilePage()));
               
      //         break;
      //       }

      //      }
      //     ,
      //     padding:EdgeInsets.all(16),
      //     tabs:const[
      //     GButton(icon: Icons.home,text:'Home'),
      //     GButton(icon: Icons.favorite_border, text: 'Favorite'),
      //     GButton(icon: LineIcons.video, text:'Media',),
      //     GButton(icon: LineIcons.user, text:'Profile'),
      //   ]
      // )
      // )
      // ),

body: 
Column(
 
  children: [
    Image.network(
      'https://m.media-amazon.com/images/M/MV5BMWE4OWE0NmMtYjlmOC00NGE1LWJiNDItNDgxNzVjYzViMGQ3XkEyXkFqcGdeQXVyNTgyNTA4MjM@._V1_Ratio0.6837_AL_.jpg',
      width: 400,
      height: 240,
      fit: BoxFit.fill,
    ),
Wrap(
  children:[
    Row(
      children:[
 Container(
  width: 80,
  height: 28,
  child: TextButton(
    onPressed: () {},
    child: Text('Action', style: TextStyle(color:Colors.white ,backgroundColor: Colors.amber[800],fontWeight: FontWeight.bold,fontSize: 20)),
  ),
),
Text('/Horror/crime',style: TextStyle(color:Colors.white ,fontWeight: FontWeight.bold,fontSize: 20)),
      ]
    ),
 
  Text(
  'Thorfinn pursues a journey with his fathers killer in order to take revenge and end his life in a duel as an honorable warrior and pay his father a homage.',
  textAlign: TextAlign.start,
  style:  TextStyle(fontSize: 18, color: Colors.white),
),
     
  ]
 
),

    

   Text(
  'Watch Movies',
  textAlign: TextAlign.start,
  style:  TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
),

  Expanded(
    
//  Container(

  child:GridView.builder(
   
    itemCount:  6,
    itemBuilder:(context,index){
        var item = _items[index];
       return Card(
        color: Colors.black,
       elevation: 0.0,
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
       child: Column(
         children: [
         
           Text(
            _items[index]["title"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)
           ),
            Container(
             height: 280.0,
             child: Image.network(
               _items[index]["image"] ,
               fit: BoxFit.cover,
             ),
           ),
          //  ButtonBar(
          //    children: [
          //      TextButton(
          //        child: const Text(' MORE',style: TextStyle(fontSize: 10.0,)),
          //        onPressed: () {/* ... */},
          //      ),
          
          //       IconButton(
          //         icon: Icon(
          //           _favorites.contains(item) ? Icons.favorite : Icons.favorite_border,
          //           color: _favorites.contains(item) ? Colors.red : null,
          //          size: 10.0,
          //         ),
          //         onPressed: () => _toggleFavorite(index),
          //       ),
          //    ],
          //  )
         ],
       ));
       
    },
   
    gridDelegate:
    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1)
  ),
   ),

  ],)
      );
    
  }



}


