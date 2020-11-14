import 'package:flutter/material.dart';
import 'package:zooexplorer/habitats/habitat_info.dart';
import 'package:zooexplorer/habitats/habitats.dart';
import 'package:zooexplorer/map/map.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      //home: MyStatefulWidget(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyStatefulWidget(),
        '/map': (context) => ZooMap(),
        '/habitats': (context) => Habitats(),
        '/habitat-info': (context) => HabitatInfo(),
      },
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/logo.png'),
            ),
            RaisedButton(
              child: Text(
                'Start', 
                style: TextStyle(fontSize: 25),),
              color: Colors.green[900],
              textColor: Colors.grey[350],
              onPressed: () {
                Navigator.pushNamed(context, '/map');
                },
            ),
          ],
        ),
      )
    );
  }
}
