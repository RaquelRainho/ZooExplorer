import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Habitat{
  String id;
  String binName;
  String consStatus;
  String diet;
  int f_lifeExpectancy;
  double f_size;
  double f_weight;
  int gestPeriod;
  LatLng location;
  int m_lifeExpectancy;
  double m_size;
  double m_weight;
  double matAge;
  String natHabitat;
  int offsprings;
  String species;
  String imageUrl;
  CollectionReference photoCollection;
  

  Habitat({
    this.id,
    this.binName,
    this.consStatus,
    this.diet,
    this.f_lifeExpectancy,
    this.f_size,
    this.f_weight,
    this.gestPeriod,
    this.location,
    this.m_lifeExpectancy,
    this.m_size,
    this.m_weight,
    this.matAge,
    this.natHabitat,
    this.offsprings,
    this.species,
    this.imageUrl,
    this.photoCollection,
    });
}