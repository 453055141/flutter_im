import 'package:flutter/material.dart';
import './app.dart';
import './loading.dart';
import './search.dart';
import './login.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '聊天室',
      theme: mDefaultTheme,
      routes: <String, WidgetBuilder>{
        "login": (BuildContext context) => new Login(),
        "app": (BuildContext context) => new App(),
        "/friends": (_) => new WebviewScaffold(
            url: 'https://flutter.io/',
            appBar: new AppBar(
              title: new Text('Flutter官网'),
            ),
            withZoom: true,
            withLocalStorage: true),
        "search": (BuildContext context) => new Search(),
      },
      home: new LoadingPage(),
    ));

final ThemeData mDefaultTheme = new ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Color(0xFFebebeb),
    cardColor: Colors.green);
