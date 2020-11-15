import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  final int id;
  GalleryPage({this.id});

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo_camera),
        backgroundColor: Colors.teal[900],
        onPressed: (){},
      ),
    );
  }
}