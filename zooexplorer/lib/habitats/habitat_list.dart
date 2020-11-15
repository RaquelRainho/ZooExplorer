/* import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:zooexplorer/services/database.dart';

import 'habitat_info.dart';

class HabitatList extends StatefulWidget {
  @override
  _HabitatListState createState() => _HabitatListState();
}

class _HabitatListState extends State<HabitatList> {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
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
                //Navigator.pushNamed(context, '/habitat-info');
                Navigator.push(context, MaterialPageRoute(builder: (context) => HabitatInfo(0)));
              },
            );
          }).toList(),
        );
      },
    );
  }
} */