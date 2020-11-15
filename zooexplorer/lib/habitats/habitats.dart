import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:zooexplorer/models/habitat.dart';
import 'package:zooexplorer/services/database.dart';
import 'package:provider/provider.dart';
import 'package:zooexplorer/habitats/habitat_list.dart';

import 'habitat_info.dart';

class Habitats extends StatefulWidget {
  Habitats({Key key}) : super(key: key);

  @override
  _HabitatsState createState() => _HabitatsState();
}

class _HabitatsState extends State<Habitats> {
  String scanResult = '';
  //function that launches the scanner
  Future scanQRCode() async {
    String cameraScanResult = await scanner.scan();
      setState(() {
      scanResult = cameraScanResult;
    });
  }


  @override
  Widget build(BuildContext context) {
    List<Habitat> habitats = Provider.of<List<Habitat>>(context);
    
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
        currentIndex: 1,
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
      body: (habitats != null)? ListView.builder(
        itemCount: habitats.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
              title: Text(habitats[index].binName),
              onTap: (){
                //Navigator.pushNamed(this.context, '/habitat-info');
                Navigator.push(this.context, MaterialPageRoute(builder: (context) => HabitatInfo(id: index)));
              },
            );
        }
      ): Center(child: CircularProgressIndicator(),),
      /* StreamBuilder<QuerySnapshot>(
      stream: DatabaseService().habitats,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Center(child: Text("Something went wrong"));
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        
        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot doc) {
            return ListTile(
              title: Text(doc.data()['name']),
              onTap: (){
                //Navigator.pushNamed(this.context, '/habitat-info');
                Navigator.push(this.context, MaterialPageRoute(builder: (context) => HabitatInfo(doc)));
              },
            );
          }).toList(),
        );
      },
    ), */
      /*body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('Habitat 4'),
              subtitle: Text('Giraffes'),
              onTap: () { Navigator.pushNamed(context, '/habitat-info'); },
            ),
            ListTile(
              title: Text('Habitat 7'),
              subtitle: Text('Lions'),
              onTap: () { Navigator.pushNamed(context, '/habitat-info'); },
            ),
            ListTile(
              title: Text('Habitat 8'),
              subtitle: Text('Zebras'),
              onTap: () { Navigator.pushNamed(context, '/habitat-info'); },
            ),
            ListTile(
              title: Text('Habitat 15'),
              subtitle: scanResult == '' ? Text('Result will be displayed here') : Text(scanResult),
              onTap: () { Navigator.pushNamed(context, '/habitat-info'); },
            ),
            
          ]
        ).toList(),
        ),*/
        floatingActionButton: FloatingActionButton(
          onPressed: (){scanQRCode();},
          backgroundColor: Colors.green[400],
          child: Icon(Icons.qr_code),),
      ),
    );
  }
}