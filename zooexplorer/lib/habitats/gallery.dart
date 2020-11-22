import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zooexplorer/models/habitat.dart';
import 'package:zooexplorer/services/database.dart';

class GalleryPage extends StatefulWidget {
  final int id;
  GalleryPage({this.id});

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  
  @override
  Widget build(BuildContext context) {
    Reference storage = Provider.of<Reference>(context);
    List<Habitat> habitats = Provider.of<List<Habitat>>(context);

    DatabaseService().photos(habitats[widget.id].id);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 130.0,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (context, index){
            return GridTile(
              child: Image.asset("assets/lion3.jpg"),
              );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo_camera),
        backgroundColor: Colors.teal[900],
        onPressed: () => _pickImage(storage, habitats[widget.id]),
      ),
    );
  }

  Future<QuerySnapshot> getImages(Habitat habitat){
    return habitat.photoCollection.get();
  }

  Future<void> _pickImage(Reference storage, Habitat habitat) async {
    String filePath = 'photos/${habitat.id}/${DateTime.now()}.jpg';
    ImagePicker imagePicker = ImagePicker();

    PickedFile selected = await imagePicker.getImage(source: ImageSource.camera);
    File image = File(selected.path);

    storage.child(filePath).putFile(image);

    setState(() {
    });
  }
}