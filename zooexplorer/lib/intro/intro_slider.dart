import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroTutorial extends StatefulWidget {
  @override
  _IntroTutorialState createState() => _IntroTutorialState();
}

class _IntroTutorialState extends State<IntroTutorial> {
  List<Slide> _slides = new List();

  @override
  void initState() {
    super.initState();

    _slides.add(
      new Slide(
        title: "MAP",
        styleTitle: TextStyle(color: Colors.green[900], fontSize: 40.0, fontWeight: FontWeight.bold),
        description: "Use the map to see where you are and locate the animal habitats!",
        styleDescription: TextStyle(color: Colors.green[900], fontSize: 20.0),
        pathImage: "assets/intro_map.png",
        backgroundColor: Colors.white,
      ),
    );
    _slides.add(
      new Slide(
        title: "HABITATS",
        styleTitle: TextStyle(color: Colors.green[900], fontSize: 40.0, fontWeight: FontWeight.bold),
        description: "In the habitats tab you can see the habitats of the zoo.\nVisit one and use the QR code scanner to unlock it!",
        styleDescription: TextStyle(color: Colors.green[900], fontSize: 20.0),
        pathImage: "assets/intro_list.png",
        backgroundColor: Colors.white,
      ),
    );
    _slides.add(
      new Slide(
        title: "HABITAT",
        styleTitle: TextStyle(color: Colors.green[900], fontSize: 40.0, fontWeight: FontWeight.bold),
        description: "Once unlocked, you can see the habitat's page to find the information about the animal inside!",
        styleDescription: TextStyle(color: Colors.green[900], fontSize: 20.0),
        pathImage: "assets/intro_info.png",
        backgroundColor: Colors.white,
      ),
    );
    _slides.add(
      new Slide(
        title: "GALLERY",
        styleTitle: TextStyle(color: Colors.green[900], fontSize: 40.0, fontWeight: FontWeight.bold),
        description: "On each habitat's page, you can also see its photo gallery and upload your own!",
        styleDescription: TextStyle(color: Colors.green[900], fontSize: 20.0),
        pathImage: "assets/intro_photos.png",
        backgroundColor: Colors.white,
      ),
    );
    _slides.add(
      new Slide(
        description: "WELCOME!",
        styleDescription: TextStyle(color: Colors.green[900], fontSize: 25.0),
        pathImage: "assets/logo.png",
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: _slides,
      onDonePress: () {
        Navigator.pushNamed(context, '/habitats');
        },
        styleNameDoneBtn: TextStyle(color: Colors.green[900]),
        styleNamePrevBtn: TextStyle(color: Colors.green[900]),
        styleNameSkipBtn: TextStyle(color: Colors.green[900]),
    );
  }
}