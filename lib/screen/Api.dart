import 'package:codelabs/screen/Login.dart';
import 'package:codelabs/screen/tabNavigattion.dart';
import 'package:codelabs/screen/Menus.dart';
import 'package:flutter/material.dart';

class TabNavigation extends StatefulWidget {
  @override
  _tapNavState createState() => _tapNavState();
}

class _tapNavState extends State<TabNavigation> {

  int _currentIndex = 0;

 final tabs = [
    Center(child: Api(),),
    Center(child: Menus(),),
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(

          currentIndex: _currentIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.orange,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Restaurantes'),),

            BottomNavigationBarItem(
              icon: Icon(Icons.cabin),
              title: Text('Menu'),),
          ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          ),
        );
  }
}
