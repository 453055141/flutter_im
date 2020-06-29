import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/config/application.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String loading = "/loading";
  static String login = "/login";
  static String app = "/app";
  static String friends = "/friends";
  static String search = "/search";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: loadingHandler);
    router.define(app, handler: homeHandler);
    router.define(loading, handler: loadingHandler);
    router.define(login,
        handler: loginHandler, transitionType: TransitionType.inFromLeft);
    router.define(search, handler: searchHandler);
    router.define(friends, handler: webViewHandler);
  }
  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params, TransitionType transition = TransitionType.native}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    LogUtil.v('我是navigateTo传递的参数：$query');

    path = path + query;
    return Application.router.navigateTo(context, path, transition:transition);
  }
}
