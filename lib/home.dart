import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/personal/personal.dart';
import 'package:flutter_im/search.dart';

import 'menu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  List<Widget> list = List();


  @override
  void initState() {
    list
      ..add(MenuPage())
      ..add(Search())
      ..add(Personal());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.menu,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                  'Menu',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.search,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                  'Search',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.person,
//                  color:_BottomNavigationColor,
                ),
                title:Text(
                  'Personal',
//                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
          ],
          currentIndex:_currentIndex,
          onTap:(int index){
            setState((){
              _currentIndex= index;
            });
          },
          selectedItemColor: Colors.green,
//          unselectedItemColor: Colors.grey,
          type:BottomNavigationBarType.fixed
      ),
    );
  }
}
