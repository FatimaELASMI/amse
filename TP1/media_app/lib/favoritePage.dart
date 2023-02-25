import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  final List<String> favorites;
  
  FavoritePage({Key? key, required this.favorites}) : super(key: key);
  
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> favorites = [];
  
  @override
  void initState() {
    super.initState();
    
    favorites = widget.favorites;
  }
  
  void removeFavorite(int index) {
    setState(() {
      favorites.removeAt(index);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: favorites.isEmpty
        ? Center(
            child: Text("No favorites yet!"),
          )
        : ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(favorites[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => removeFavorite(index),
                ),
              );
            },
          ),
    );
  }
}
