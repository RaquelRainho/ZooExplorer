import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zooexplorer/models/habitat.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {

  // collection reference
  final CollectionReference habitatCollection = FirebaseFirestore.instance.collection('habitats');

  // storage instance
  final FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: "gs://cm-zoo-explorer.appspot.com");

  // get habitats stream
  Stream<List<Habitat>> get habitats{
    return habitatCollection.snapshots()
    .map((QuerySnapshot querySnapshot) => 
      querySnapshot.docs
      .map((DocumentSnapshot documentSnapshot) => Habitat(
                                                    id: documentSnapshot.id,
                                                    binName: documentSnapshot.data()["binName"],
                                                    consStatus: documentSnapshot.data()["consStatus"],
                                                    diet: documentSnapshot.data()["diet"],
                                                    f_lifeExpectancy: documentSnapshot.data()["f_lifeExpectancy"],
                                                    f_size: documentSnapshot.data()["f_size"],
                                                    f_weight: documentSnapshot.data()["f_weight"],
                                                    gestPeriod: documentSnapshot.data()["gestPeriod"],
                                                    location: LatLng(documentSnapshot.data()["location"].latitude, documentSnapshot.data()["location"].longitude),
                                                    m_lifeExpectancy: documentSnapshot.data()["m_lifeExpectancy"],
                                                    m_size: documentSnapshot.data()["m_size"],
                                                    m_weight: documentSnapshot.data()["m_weight"],
                                                    matAge: documentSnapshot.data()["matAge"],
                                                    natHabitat: documentSnapshot.data()["natHabitat"],
                                                    offsprings: documentSnapshot.data()["offsprings"],
                                                    species: documentSnapshot.data()["species"],
                                                    imageUrl: documentSnapshot.data()["imageUrl"],
                                                    photoCollection: documentSnapshot.data()["photos"]),
                                                  )
      .toList()
    );
  }

  // get storage reference
  Reference get storageReference{
    return storage.ref();
  }

  // get the list of photos of an habitat
  Future<List<String>> photos(String id){
    final Reference storRef = storage.ref().child('photos').child(id);
    storRef.listAll().then((ListResult list){
        return list.items.map((Reference ref){
            ref.fullPath;
            print(ref.fullPath);
          }
        ).toList();
      }
    );
  }
}