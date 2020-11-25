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
  bool _id_sorted = true;

  //function that launches the scanner
  Future scanQRCode() async {
    String cameraScanResult = await scanner.scan();
    if (!_unlockedHabitats.contains(cameraScanResult)){
      _unlockedHabitats.add(cameraScanResult);
      _storage.setItem("unlocked", _unlockedHabitats).then((value) => setState((){}));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Habitat> habitats = Provider.of<List<Habitat>>(context);
    _unlockedHabitats = _storage.getItem("unlocked") ?? List<String>();
    _storage.ready.then((value) => setState((){}));
    if (habitats != null)
      habitats.sort((a,b) { if (_id_sorted || _unlockedHabitats.contains(a.id) == _unlockedHabitats.contains(b.id))
                              return int.parse(a.id) - int.parse(b.id);
                            else if (_unlockedHabitats.contains(a.id))
                              return -1;
                            return 1; });
    
    return MaterialApp(
      home: Scaffold(
        appBar: appbar(
          <Widget>[
            FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(_id_sorted ? Icons.filter_1 : Icons.filter, color: Colors.grey[400]),
                  Icon(Icons.filter_list_alt, color: Colors.grey[400],)]),
              onPressed: (){ setState((){_id_sorted = !_id_sorted;});})
          ],),
      bottomNavigationBar: bottomNavigationBar(context, 1),
      body: (habitats != null) ? ListView.builder(
        itemCount: habitats.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            child: InkWell(
              onTap: () {
                _unlockedHabitats.contains(habitats[index].id) ? Navigator.push(this.context, MaterialPageRoute(builder: (context) => HabitatInfo(id: index))) : null;
              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Ink.image(
                    colorFilter: _unlockedHabitats.contains(habitats[index].id) ? null : ColorFilter.mode(Colors.grey, BlendMode.saturation),
                    height: 120,
                    image: AssetImage(habitats[index].imageUrl),
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: const EdgeInsets.all( 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Habitat " + habitats[index].id, style: TextStyle(color: Colors.white, /*backgroundColor: Colors.blue,*/ fontSize: 26.0, fontWeight: FontWeight.bold),),
                        Text(_unlockedHabitats.contains(habitats[index].id) ? habitats[index].species + "s" : "[visit to unlock]", style: TextStyle(color: Colors.white, /*backgroundColor: Colors.blue,*/ fontSize: 16.0, fontStyle: FontStyle.italic),),
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