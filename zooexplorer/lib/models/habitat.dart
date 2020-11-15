import 'package:google_maps_flutter/google_maps_flutter.dart';

class Habitat{
  String id;
  String binName;
  String consStatus;
  String diet;
  int f_lifeExpectancy;
  int f_size;
  int f_weight;
  int gestPeriod;
  LatLng location;
  int m_lifeExpectancy;
  int m_size;
  int m_weight;
  int matAge;
  String natHabitat;
  int offsprings;
  String species;
  

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
    });
}