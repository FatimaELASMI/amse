import 'package:flutter/material.dart';
import 'main.dart' as Home;

class AvatarSelection extends StatelessWidget {
  final Function(String) onAvatarSelected;

  AvatarSelection({required this.onAvatarSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'Choisissez votre avatar',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Image.asset('assets/avatar1.jpg'),
            title: Text('Avatar 1'),
            onTap: () {
              onAvatarSelected('assets/avatar1.jpg');
            },
          ),
          ListTile(
            leading: Image.asset('assets/avatar2.jpg'),
            title: Text('Avatar 2'),
            onTap: () {
              onAvatarSelected('assets/avatar2.jpg');
            },
          ),
          ListTile(
            leading: Image.asset('assets/avatar3.jpg'),
            title: Text('Avatar 3'),
            onTap: () {
              onAvatarSelected('assets/avatar3.jpg');
            },
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "EL-ASMI Fatima zahrae";
  String email = "fatiasmi@example.com";
  String phoneNumber = "+1 (555) 123-4567";
  String bio = "developpement web et mobile";

  String _avatarImage =
      "assets/avatar1.jpg"; // initialisez la première image par défaut

  void _showAvatarSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AvatarSelection(onAvatarSelected: (image) {
          setState(() {
            _avatarImage = image;
          });
          Navigator.pop(context);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile',
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      bottomNavigationBar: Home.NavBarBottom(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                _showAvatarSelection(context);
              },
              child: CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage(_avatarImage),
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
      ),
    );
  }
}
