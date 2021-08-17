import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:yellowclassapp/screens/extrascreens/MainPage.dart';
import 'package:yellowclassapp/screens/extrascreens/Profile.dart';
import 'package:yellowclassapp/screens/homescreen/home.dart';

class NavBarSelect extends StatefulWidget {
  @override
  _NavBarSelectState createState() => _NavBarSelectState();
}

class _NavBarSelectState extends State<NavBarSelect> {
  int currentIndex = 0;
  int _c=0;
  @override
  Widget build(BuildContext context) {
    final pages=[
      MainPage(),
      HomeScreen(),
      //Covidhelp(),
      Profile()
    ];
    return Scaffold(
      body: pages[_c],
        bottomNavigationBar:  BottomNavigationBar(
          currentIndex: _c,
          type: BottomNavigationBarType.fixed,
          backgroundColor:Color.fromRGBO(23, 23, 31, 1) ,
          iconSize: 22,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 10,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.home),
              title: Text('.'),

            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.compassOutline),
              title: Text('.'),

            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.link2Outline),
              title: Text('.'),
            ),
            BottomNavigationBarItem(
              icon:Icon(EvaIcons.person),
              title: Text('.'),
            )
          ],
          onTap: (index){
            setState(() {
              _c=index;
            });
          },
        )
    );
  }
}
