import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:zooexplorer/habitats/habitat_info.dart';
import 'package:zooexplorer/models/habitat.dart';

/*
class ZooMap extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZooMapPage(),
    );
  }
}
*/

class ZooMap extends StatefulWidget {
  final LatLng initialPos;

  ZooMap({Key key, this.initialPos}) : super(key: key);

  @override
  _ZooMapState createState() => _ZooMapState();
}

class _ZooMapState extends State<ZooMap> {

  List<Habitat> _habitats = List();
  List<dynamic> _unlockedHabitats = List();
  final LocalStorage _storage = new LocalStorage('habitats');
  Set<Marker> _markers = {};
  BitmapDescriptor pinLocationIcon;

  GoogleMapController _mapController;
  final LatLng _center = const LatLng(40.633528, -8.657161);
  final double _zoom = 16.5;
  
  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/animal-marker.png").then((onValue) {
      pinLocationIcon = onValue;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    rootBundle.loadString('assets/map_style.json').then((String mapStyle) {
      _mapController.setMapStyle(mapStyle);
    });
    setState(() {
      _markers.clear();
      _unlockedHabitats = _storage.getItem("unlocked") ?? List<String>();
      _habitats.forEach((element) {
        _markers.add(
          Marker(markerId: MarkerId(element.id), 
                  position: element.location,
                  infoWindow: InfoWindow(title: "Habitat " + element.id + "\tⓘ", 
                                          snippet: element.species + "s", 
                                          onTap: (){_unlockedHabitats.contains(element.id) ? Navigator.push(this.context, MaterialPageRoute(builder: (context) => HabitatInfo(id: int.parse(element.id)-1))) : null;}),
                  icon: pinLocationIcon,
                  alpha: _unlockedHabitats.contains(element.id) ? 1.0 : 0.5,
                ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _habitats = Provider.of<List<Habitat>>(context);
    return MaterialApp(
      home: Scaffold(
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Habitats'
          ),
        ],
        selectedItemColor: Colors.green[600],
        currentIndex: 0,
        onTap: (int index) {
          setState(() {
            switch(index) {
              case 0: //Map
                      Navigator.pushNamed(context, '/map');
                      break;
              case 1: //Habitats
                      Navigator.pushNamed(context, '/habitats');
                      break;
            }
          });
        },
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: widget.initialPos,
          zoom: _zoom,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: _markers,
        ),
      ),
    );
  }
}