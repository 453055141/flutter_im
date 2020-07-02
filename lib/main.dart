import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter_im/http/api.dart';

import 'config/application.dart';
import 'config/routes.dart';
import 'http/http_manager.dart';
import 'http/log_interceptor.dart';



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

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '聊天室',
      theme: mDefaultTheme,
      onGenerateRoute: Application.router.generator,
    );
  }
}

//void main() => runApp(MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: '聊天室',
//      theme: mDefaultTheme,
//      routes: <String, WidgetBuilder>{
//        "login": (BuildContext context) => Login(),
//        "app": (BuildContext context) => App(),
//        "/friends": (_) => WebviewScaffold(
//            url: 'https://flutter.io/',
//            appBar: AppBar(
//              title: Text('Flutter官网'),
//            ),
//            withZoom: true,
//            withLocalStorage: true),
//        "search": (BuildContext context) => new Search(),
//      },
//      home: LoadingPage(),
//    ));

final ThemeData mDefaultTheme = new ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Color(0xFFebebeb),
    cardColor: Colors.green);
