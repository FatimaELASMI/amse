import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "John Doe";
  String email = "johndoe@example.com";
  String phoneNumber = "+1 (555) 123-4567";
  String bio = "Hello, I'm John. Nice to meet you!";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // navigate to the edit profile page
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          CircleAvatar(
            radius: 64,
            backgroundImage: NetworkImage(
              "https://www.example.com/my-profile-image.jpg",
            ),
          ),
          SizedBox(height: 16),
          Text(
            name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(email),
          SizedBox(height: 8),
          Text(phoneNumber),
          SizedBox(height: 16),
          Text(bio),
        ],
      ),
    );
  }
}
