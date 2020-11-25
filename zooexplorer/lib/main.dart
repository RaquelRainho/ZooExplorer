import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:zooexplorer/habitats/habitats.dart';
import 'package:zooexplorer/intro/intro_slider.dart';
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
            '/': (context) => Home(),
            '/map': (context) => ZooMap(initialPos: LatLng(40.63191945636097, -8.657524065137872)),
            '/habitats': (context) => Habitats(),
          },
        ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

/// This is the private State class that goes with Home.
class _HomeState extends State<Home> {
  final LocalStorage _storage = new LocalStorage('preferences');
  bool _firstTime;

  @override
  void initState(){
    super.initState();
    _storage.ready.then((value) => setState((){
      _firstTime = _storage.getItem('first_time') ?? true;
    }));
  }
  
  @override
  Widget build(BuildContext context) {
    if (_firstTime == null)
      return Center(
              child: CircularProgressIndicator(),
            );
    else
      return _firstTime ? IntroTutorial() : Habitats();
  }
}
