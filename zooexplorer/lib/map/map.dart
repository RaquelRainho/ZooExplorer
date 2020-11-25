import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:zooexplorer/habitats/habitat_info.dart';
import 'package:zooexplorer/models/habitat.dart';
import 'package:zooexplorer/widgets/widgets.dart';

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
        appBar: appbar([]),
      bottomNavigationBar: bottomNavigationBar(context, 0),
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