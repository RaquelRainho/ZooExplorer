import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:zooexplorer/models/habitat.dart';
import 'package:provider/provider.dart';
import 'package:zooexplorer/widgets/widgets.dart';

import 'habitat_info.dart';

class Habitats extends StatefulWidget {
  Habitats({Key key}) : super(key: key);

  @override
  _HabitatsState createState() => _HabitatsState();
}

class _HabitatsState extends State<Habitats> {
  Uint8List imageBytes;
  final LocalStorage _storage = new LocalStorage('habitats');
  List<dynamic> _unlockedHabitats = List();
  List<Habitat> _habitats;
  bool _idSorted = true;

  //function that launches the scanner
  Future scanQRCode() async {
    String cameraScanResult = await scanner.scan();
    // Check if the QR code scanned is a valid habitat id
    if (_habitats.any((element) => element.id == cameraScanResult)){
      // Check if the QR code wasn't already scanned before
      if (!_unlockedHabitats.contains(cameraScanResult)){
        _unlockedHabitats.add(cameraScanResult);
        _storage.setItem("unlocked", _unlockedHabitats).then((value) => setState((){}));
        Navigator.push(this.context, MaterialPageRoute(builder: (context) => HabitatInfo(id: cameraScanResult)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _habitats = Provider.of<List<Habitat>>(context);
    _unlockedHabitats = _storage.getItem("unlocked") ?? List<String>();
    _storage.ready.then((value) => setState((){}));
    if (_habitats != null)
      _habitats.sort((a,b) { if (_idSorted || _unlockedHabitats.contains(a.id) == _unlockedHabitats.contains(b.id))
                              return int.parse(a.id) - int.parse(b.id);
                            else if (_unlockedHabitats.contains(a.id))
                              return -1;
                            return 1; });
    print(_unlockedHabitats);
    return MaterialApp(
      home: Scaffold(
        appBar: appbar(
          <Widget>[
            FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(_idSorted ? Icons.filter_1 : Icons.filter, color: Colors.grey[400]),
                  Icon(Icons.sort, color: Colors.grey[400],)]),
              onPressed: (){ setState((){_idSorted = !_idSorted;});})
          ],),
      bottomNavigationBar: bottomNavigationBar(context, 1),
      body: (_habitats != null) ? ListView.builder(
        itemCount: _habitats.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () {
                _unlockedHabitats.contains(_habitats[index].id) ? Navigator.push(this.context, MaterialPageRoute(builder: (context) => HabitatInfo(id: _habitats[index].id))) : null;
              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Ink.image(
                    colorFilter: _unlockedHabitats.contains(_habitats[index].id) ? null : ColorFilter.mode(Colors.grey, BlendMode.saturation),
                    height: 120,
                    image: AssetImage(_habitats[index].imageUrl),
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: const EdgeInsets.all( 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Habitat " + _habitats[index].id, style: TextStyle(color: Colors.white, /*backgroundColor: Colors.blue,*/ fontSize: 26.0, fontWeight: FontWeight.bold),),
                        Text(_unlockedHabitats.contains(_habitats[index].id) ? _habitats[index].species + "s" : "[visit to unlock]", style: TextStyle(color: Colors.white, /*backgroundColor: Colors.blue,*/ fontSize: 16.0, fontStyle: FontStyle.italic),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ) : Center(child: CircularProgressIndicator(),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){scanQRCode();},
        backgroundColor: Colors.green[400],
        child: Icon(Icons.qr_code),),
      ),
    );
  }
}