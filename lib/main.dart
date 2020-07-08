
import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter_im/http/api.dart';

import 'config/application.dart';
import 'config/routes.dart';
import 'http/http_manager.dart';
import 'http/log_interceptor.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:pangolin/pangolin.dart' as Pangolin;



void main(){
  //创建一个Router对象
  final router = Router();
  //配置Routes注册管理
  Routes.configureRoutes(router);
  //将生成的router给全局化
  Application.router = router;

//初始化 Http，
  HttpManager().init(
    baseUrl: API.BASE_URL,
    interceptors: [
      MyLogInterceptor(),
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    Pangolin.pangolinResponseEventHandler.listen((value)
    {
      if(value is Pangolin.onRewardResponse)
      {
        print("激励视频回调：${value.rewardVerify}");
        print("激励视频回调：${value.rewardName}");
        print("激励视频回调：${value.rewardAmount}");
      }
      else
      {
        print("回调类型不符合");
      }
    });
    super.initState();
    initPlatformState();
  }


  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;

    Map<Permission, PermissionStatus> statuses = await [
      Permission.phone,
      Permission.location,
      Permission.storage,
    ].request();
    //校验权限
    if(statuses[Permission.location] != PermissionStatus.granted){
      print("无位置权限");
    }
    _initPangolin();
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

//  "5056758",
//  true,
//  "爱看",
//  true,
//  true,
//  true,
//  true
  _initPangolin() async
  {
    await Pangolin.registerPangolin(
        appId: "5084962",
        useTextureView: true,
        appName: "天地人全录",
        allowShowNotify: true,
        allowShowPageWhenScreenLock: true,
        debug: true,
        supportMultiProcess: true
    ).then((v){
      _loadSplashAd();
    });
  }

  _loadSplashAd() async
  {
    Pangolin.loadSplashAd(
        mCodeId: "887310537",
        debug: false);
  }

  //945122969
  _loadRewardAd() async
  {
    await Pangolin.loadRewardAd(
        isHorizontal: false,
        debug: false,
        mCodeId: "887343889",
        supportDeepLink: true,
        rewardName: "书币",
        rewardAmount: 3,
        isExpress: true,
        expressViewAcceptedSizeH: 500,
        expressViewAcceptedSizeW: 500,
        userID: "user123",
        mediaExtra: "media_extra"
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '聊天室',
      theme: mDefaultTheme,
      onGenerateRoute: Application.router.generator,
    );
  }
}

final ThemeData mDefaultTheme = new ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Color(0xFFebebeb),
    cardColor: Colors.green);
