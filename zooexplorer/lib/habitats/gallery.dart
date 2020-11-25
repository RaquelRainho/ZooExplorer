import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zooexplorer/models/habitat.dart';
import 'package:zooexplorer/services/database.dart';

import 'image.dart';

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


    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: DatabaseService().photos(habitats[widget.id].id),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            if(snapshot.hasError)
              return Center(
                child: Text("Error!"),
              );
            else
              print("Filepath 1: ${snapshot.data}");
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 130.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index){
                    return ImageGridTile(filePath: snapshot.data[index], id: habitats[widget.id].id,);
                  },
                ),
              );   
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo_camera),
        backgroundColor: Colors.teal[900],
        onPressed: () => _pickImage(storage, habitats[widget.id]),
      ),
    );
  }

  Future<void> _pickImage(Reference storage, Habitat habitat) async {
    UploadTask _uploadTask;
    String filePath = 'photos/${habitat.id}/${DateTime.now()}.jpg';
    ImagePicker imagePicker = ImagePicker();

    PickedFile selected = await imagePicker.getImage(source: ImageSource.camera);
    File image = File(selected.path);
    image.length().then((value) => print("Before compression: $value"));
    File compressedFile = await compressImage(image);
    compressedFile.length().then((value) => print("After compression: $value"));

    _uploadTask = storage.child(filePath).putFile(compressedFile);
    _uploadTask.then((data) => 
    setState(() {
      })
    );
  }

  Future<File> compressImage(File file) async{
    final _filePath = file.absolute.path;

    final lastIndex = _filePath.lastIndexOf(new RegExp(r'.jp'));
    final splitted = _filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${_filePath.substring(lastIndex)}";

    File compressed = await FlutterImageCompress.compressAndGetFile(
        _filePath,
        outPath,
        minWidth: 1000,
        minHeight: 1000,
        quality: 70);
    return compressed;
    }
}

class ImageGridTile extends StatefulWidget {
  final String filePath;
  final String id;

  ImageGridTile({this.filePath, this.id});

  @override
  _ImageGridTileState createState() => _ImageGridTileState();
}

class _ImageGridTileState extends State<ImageGridTile> {
  Uint8List imageFile;
  Reference photosReference = FirebaseStorage.instance.ref();

  getImage(){
    photosReference.child("${widget.filePath}").getData(100000000).then((data){
      this.setState(() {
        imageFile = data;
      });
      }
    ).catchError((error){});
  }

  Widget decideGridTile(){
    if(imageFile == null){
      return Center(child: CircularProgressIndicator(),);
    }else{
      return GestureDetector(
        onTap: (){
          Navigator.push(this.context, MaterialPageRoute(builder: (context) => ZoomImage(img: imageFile)));
        },
        child: Image.memory(imageFile, fit: BoxFit.cover)
        );
    }
  }

  @override
  void initState(){
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: decideGridTile(),
    );
  }
}