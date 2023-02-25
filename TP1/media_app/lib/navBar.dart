import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';


class NavBarBottom extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
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
            print(index);
           }
          ,
          padding:EdgeInsets.all(16),
          tabs:const[
          GButton(icon: Icons.home,text:'Home'),
          GButton(icon: Icons.favorite_border, text: 'Likes'),
          GButton(icon: LineIcons.video, text:'Media'),
          GButton(icon: LineIcons.user, text:'Profile'),
        ]
      )
      )
      ),
    );
      
      
      

  }
}