import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';

class ZoomImage extends StatelessWidget {
  final Uint8List img;

  ZoomImage({this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: Scaffold(
            appBar: AppBar(
          title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    Image.asset(
                  'assets/logo_short2.png',
                    fit: BoxFit.contain,
                    height: 48,
                ),
                Container(
                    padding: const EdgeInsets.all(8.0), child: Text('Zoo Explorer'))
              ],
            ),
          backgroundColor: Colors.green[900],
          centerTitle: true,
        ),
            body: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: Container(
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                Container(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.memory(
                          this.img,
                          //height: 300,
                          //width: 300,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}