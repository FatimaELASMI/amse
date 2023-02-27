import 'package:flutter/material.dart';

class FavoriteListScreen extends StatelessWidget {
  final List  favorites;

  FavoriteListScreen({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite List"),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (BuildContext context, int index) {
          var item = favorites[index];
          return ListTile(
           
          
             leading: Image.network(item['image']),
              title: Text(item['title']),
             
                trailing: IconButton(
    icon: Icon(Icons.delete),
    onPressed: () {
       
      print('dkhal');
        favorites.remove(item);
     
      // Code to delete this item from the list
    },
  ),
          );
        },
      ),
    );
  }
}


