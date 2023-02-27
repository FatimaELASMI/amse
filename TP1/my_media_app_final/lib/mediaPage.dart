import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'navBar.dart' as navBar;
import 'profilePage.dart' as profile;
import 'favoritePage.dart' as favorite;
import 'mediaPage.dart' as media;
import 'main.dart' as homePage;


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   
     const MyApp({Key? key, }) : super(key: key);
  @override
  MediaApp createState() => MediaApp();
}

class MediaApp extends State<MyApp> {
 final List favorites=[];
   List _items =[];


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
 List _favorites = [];

 int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  // ];
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
         switch(index){
              case 0: 
                // Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()), );
              break;
               case 1: 
                // Navigator.push(context,MaterialPageRoute(builder: (context) => favorite.FavoriteListScreen(favorites: _favorites)), );
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
    return MaterialApp(
      title: 'media ',
      home: Scaffold(
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

    //    Container(
    //     color: Colors.black,
    //     child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal:15.0,vertical:20),
    //     child: GNav(
    //       backgroundColor: Colors.black,
    //       color: Colors.white,
    //       activeColor: Colors.white,
    //       tabBackgroundColor:Colors.grey.shade800,
    //       gap:8,
    //       onTabChange:(index){
    //         switch(index){
    //           case 0: 
    //             Navigator.push(context,MaterialPageRoute(builder: (context) => homePage.HomePage()), );
    //           break;
    //            case 1: 
    //             Navigator.push(context,MaterialPageRoute(builder: (context) => favorite.FavoriteListScreen(favorites:favorites)), );
    //           break;
    //           case 2:
    //             Navigator.push(context,MaterialPageRoute(builder: (context) => media.MyApp()), );
    //           break;
    //           case 3:
    //           // Navigator.push(context,MaterialPageRoute(builder:(context)=>favorite.FavoritePage()));
    //             Navigator.push(context,MaterialPageRoute(builder:(context)=>profile.ProfilePage()));
               
    //           break;
    //         }

    //        }
    //       ,
    //       padding:EdgeInsets.all(16),
    //       tabs:const[
    //       GButton(icon: Icons.home,text:'Home'),
    //       GButton(icon: Icons.favorite_border, text: 'Favorite'),
    //       GButton(icon: LineIcons.video, text:'Media',),
    //       GButton(icon: LineIcons.user, text:'Profile'),
    //     ]
    //   )
    //   )
    //   ),

        body: GridView.builder(
          itemCount: 12,
           padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
             
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Column(
                children:[
                     Container(
                        height:150.0,
              child:Image.network(
              _items[index]['image'],
              fit: BoxFit.fill,
            )),
            Text( _items[index]['title'],style: TextStyle(
    color: Colors.black,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  ),),  
                ]
                 );
           
          },
        ),
      ),
    );
  }
}


