import 'package:flutter/material.dart';

Widget appbar(List<Widget> actions){
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
        'assets/logo_short2.png',
        fit: BoxFit.contain,
        height: 48,
      ),
        Container(
          padding: const EdgeInsets.all(8.0), child: Text('Zoo Explorer')
        ),
      ],
    ),
    actions: actions,
    backgroundColor: Colors.green[900],
    centerTitle: true,
  );
}

Widget bottomNavigationBar(BuildContext context, int currentIndex){
  return BottomNavigationBar(
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
        currentIndex: currentIndex,
        onTap: (int index) {
            switch(index) {
              case 0: //Map
                      Navigator.pushNamed(context, '/map');
                      break;
              case 1: //Habitats
                      Navigator.pushNamed(context, '/habitats');
                      break;
            }
          //});
        },
      );
}