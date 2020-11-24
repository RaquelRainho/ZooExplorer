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
        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        //pathImage: "images/photo_eraser.png",
        backgroundColor: Color(0xfff5a623),
      ),
    );
    _slides.add(
      new Slide(
        title: "PENCIL",
        description: "Ye indulgence unreserved connection alteration appearance",
        //pathImage: "images/photo_pencil.png",
        backgroundColor: Color(0xff203152),
      ),
    );
    _slides.add(
      new Slide(
        title: "RULER",
        description:
        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        //pathImage: "images/photo_ruler.png",
        backgroundColor: Color(0xff9932CC),
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
    );
  }
}