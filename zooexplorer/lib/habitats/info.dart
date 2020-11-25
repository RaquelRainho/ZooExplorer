import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zooexplorer/models/habitat.dart';
import 'package:zooexplorer/presentation/custom_icons.dart';

class InfoPage extends StatelessWidget {
  final int id;
  InfoPage({this.id});

  @override
  Widget build(BuildContext context) {
    List<Habitat> habitats = Provider.of<List<Habitat>>(context);

    return Container( 
      color: Colors.grey[300],
      child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
              child: Text("CHARACTERISTICS", style: TextStyle(color: Colors.teal[800], fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.grey[300],
                ),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                border: TableBorder.symmetric(
                  inside: BorderSide(
                    width: 3,
                    color: Colors.grey[300],
                  )
                ),
                children: [
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Species", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(habitats[id].species, textAlign: TextAlign.center,
                      ),
                    ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Binomial Name", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text(habitats[id].binName, textAlign: TextAlign.center,
                      ),
                    ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Conservation Status", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text(habitats[id].consStatus, textAlign: TextAlign.center,
                      ),
                    ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Diet", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text(habitats[id].diet, textAlign: TextAlign.center,
                      ),
                    ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Natural Habitat", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text(habitats[id].natHabitat, textAlign: TextAlign.center,
                      ),
                    ),
                    ]
                  ),
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
              child: Text("LIFECYCLE", style: TextStyle(color: Colors.teal[800], fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.grey[300],
                ),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                border: TableBorder.symmetric(
                  inside: BorderSide(
                    width: 3,
                    color: Colors.grey[300],
                  )
                ),
                children: [
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Number of offsprings", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(habitats[id].offsprings.toString(), textAlign: TextAlign.center,
                      ),
                    ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Age of maturity", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text(habitats[id].matAge.toString() + " months", textAlign: TextAlign.center,
                      ),
                    ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Gestation period", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text(habitats[id].gestPeriod.toString() + " months", textAlign: TextAlign.center,
                      ),
                    ),
                    ]
                  ),
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
              child: Text("AVERAGES", style: TextStyle(color: Colors.teal[800], fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.grey[300],
                ),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                border: TableBorder.symmetric(
                  inside: BorderSide(
                    width: 3,
                    color: Colors.grey[300],
                  )
                ),
                children: [
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Size", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Row(children: [
                                Icon(Custom.female, color: Colors.pink, size: 20,),
                                Text(habitats[id].f_size.toString() + " m",),
                                ],)
                            ]),
                            Column(
                              children: [
                                Row(children: [
                                Icon(Custom.male, color: Colors.blue, size: 20,),
                                Text(" " + habitats[id].m_size.toString() + " m",)],
                                )],
                              ),
                          ]),
                    ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Life Expectancy", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Row(children: [
                                Icon(Custom.female, color: Colors.pink, size: 20,),
                                Text(habitats[id].f_lifeExpectancy.toString() + " years",),
                                ],)
                            ]),
                            Column(
                              children: [
                                Row(children: [
                                Icon(Custom.male, color: Colors.blue, size: 20,),
                                Text(" " + habitats[id].m_lifeExpectancy.toString() + " years",)],
                                )],
                              ),
                          ]),
                    ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Weight", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Row(children: [
                                Icon(Custom.female, color: Colors.pink, size: 20,),
                                Text(habitats[id].f_weight.toString() + " kg",),
                                ],)
                            ]),
                            Column(
                              children: [
                                Row(children: [
                                Icon(Custom.male, color: Colors.blue, size: 20,),
                                Text(" " + habitats[id].m_weight.toString() + " kg",)],
                                )],
                              ),
                          ]),
                    ),
                    ]
                  ),
                ],
              )
            ),
          ],
        ),
    );
  }
}