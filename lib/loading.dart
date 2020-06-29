import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
   super.initState();
   new Future.delayed(new Duration(seconds: 3),(){
     print("flutter即时通讯APP加载页");
     Navigator.of(context).pushReplacementNamed("login");
   });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: new Center(
      child: Stack(children: <Widget>[
        Image.asset("images/加载图.jpeg",fit: BoxFit.cover,)
      ],),
    ),);
  }
}
