import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
import 'dart:async';

import 'package:flutter_im/config/routes.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String _info = '';
  @override
  void initState() {
   super.initState();
   _initAsync();
  }

  _initAsync() async {
    /// App启动时读取Sp数据，需要异步等待Sp初始化完成。
    await SpUtil.getInstance();
    Future.delayed(new Duration(milliseconds: 500), () {
      /// 同步使用Sp。
      /// 是否显示引导页。
        _initSplash();
    });
  }

  /// App引导页逻辑。
  void _initBanner() {
    setState(() {
      _info = "欢迎使用曾凯开发的APP";
    });
  }

  /// App广告页逻辑。
  void _initSplash() {
    setState(() {
      _info = "广告页，2秒后跳转到登录";
    });
    new Future.delayed(new Duration(seconds: 3),(){
      LogUtil.v("flutter即时通讯APP加载页");
      Routes.navigateTo(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Center(
          child: Stack(children: <Widget>[
            Image.asset("images/加载图.jpeg",fit: BoxFit.cover,)
          ],),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Routes.navigateTo(context, Routes.login);
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Container(child: new Center(
//      child: Stack(children: <Widget>[
//        Image.asset("images/加载图.jpeg",fit: BoxFit.cover,)
//      ],),
//    ),);
//  }
}
