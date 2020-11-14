import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        child: Text("Habitat 01", textAlign: TextAlign.center,
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
                        child: Text("Europe", textAlign: TextAlign.center,
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
                        child: Text("3", textAlign: TextAlign.center,
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
                        child: Text("3", textAlign: TextAlign.center,
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
                        child: Text("3", textAlign: TextAlign.center,
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
                        child: Text("Habitat 01", textAlign: TextAlign.center,
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
                        child: Text("Europe", textAlign: TextAlign.center,
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
                        child: Text("3", textAlign: TextAlign.center,
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
                        child: Text("Habitat 01", textAlign: TextAlign.center,
                      ),
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
                        child: Text("Europe", textAlign: TextAlign.center,
                      ),
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
                        child: Text("3", textAlign: TextAlign.center,
                      ),
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