import 'package:flutter/material.dart';
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
  GoogleMapController mapController;

  final LatLng _center = const LatLng(40.636379, -8.653336);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
        backgroundColor: Colors.green,
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
          zoom: 16.5,
          ),
        ),
      ),
    );
  }
}