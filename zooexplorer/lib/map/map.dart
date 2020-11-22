import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ZooMap extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZooMapPage(),
    );
  }
}

class ZooMapPage extends StatefulWidget {
  ZooMapPage({Key key}) : super(key: key);

  @override
  _ZooMapState createState() => _ZooMapState();
}

class _ZooMapState extends State<ZooMapPage> {

  Map<int, LatLng> habitats = {0: LatLng(40.633428, -8.658037),
                                1: LatLng(40.634462, -8.656953),
                                2: LatLng(40.634845, -8.657393)};
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
      habitats.forEach((key, value) {
        _markers.add(
          Marker(markerId: MarkerId(key.toString()), 
                  position: value,
                  infoWindow: InfoWindow(title: "Habitat " + key.toString() + "\tⓘ", 
                                          snippet: "Lions", 
                                          onTap: 1>1 ? null : null),
                  icon: pinLocationIcon,
                  alpha: key>1 ? 0.5 : 1.0
                ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
          target: _center,
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