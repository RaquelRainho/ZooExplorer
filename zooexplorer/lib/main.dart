import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zooexplorer/habitats/habitat_info.dart';
import 'package:zooexplorer/habitats/habitats.dart';
import 'package:zooexplorer/map/map.dart';
import 'package:zooexplorer/models/habitat.dart';
import 'package:zooexplorer/services/database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider<List<Habitat>>.value(
                value: DatabaseService().habitats,),
          Provider<Reference>.value(value: DatabaseService().storageReference),
        ],
        child: MaterialApp(
          title: _title,
          //home: MyStatefulWidget(),
          initialRoute: '/',
          routes: {
            '/': (context) => MyStatefulWidget(),
            '/map': (context) => ZooMap(),
            '/habitats': (context) => Habitats(),
          },
        ),
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
                Navigator.pushNamed(context, '/habitats');
                },
            ),
          ],
        ),
      )
    );
  }
}
