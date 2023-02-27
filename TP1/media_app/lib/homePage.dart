import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class ImageModel {
  final String imageUrl;
  bool isLiked;

  ImageModel({required this.imageUrl, this.isLiked = false});
}

class ImageGrid extends StatefulWidget {
  @override
  _ImageGridState createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  List<ImageModel> _images = [
    ImageModel(imageUrl: 'https://picsum.photos/seed/1/300/300'),
    ImageModel(imageUrl: 'https://picsum.photos/seed/2/300/300'),
    ImageModel(imageUrl: 'https://picsum.photos/seed/3/300/300'),
    ImageModel(imageUrl: 'https://picsum.photos/seed/4/300/300'),
    ImageModel(imageUrl: 'https://picsum.photos/seed/5/300/300'),
    ImageModel(imageUrl: 'https://picsum.photos/seed/6/300/300'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _images.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _images[index].isLiked = !_images[index].isLiked;
            });
          },
          child: Stack(
            children: [
              Image.network(_images[index].imageUrl, fit: BoxFit.cover),
              Positioned(
                top: 8,
                right: 8,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _images[index].isLiked = !_images[index].isLiked;
                    });
                  },
                  child: Icon(
                    _images[index].isLiked ? Icons.favorite : Icons.favorite_border,
                    color: _images[index].isLiked ? Colors.red : Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
