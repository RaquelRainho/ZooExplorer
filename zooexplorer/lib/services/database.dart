import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String id;
  DatabaseService({this.id});

  // collection reference
  final CollectionReference habitatCollection = FirebaseFirestore.instance.collection('habitats');

  // get habitats stream
  Stream<QuerySnapshot> get habitats{
    return habitatCollection.snapshots();
  }

}