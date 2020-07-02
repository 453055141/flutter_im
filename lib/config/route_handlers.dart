import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../home.dart';
import '../app.dart';
import '../menu.dart';
import '../loading.dart';
import '../search.dart';
import '../login.dart';
import '../web_view.dart';

var appHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return App();
});

var homeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Home();
});

var loadingHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return LoadingPage();
});

var loginHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Login();
});

var searchHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Search();
});

var menuHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MenuPage();
});

// 网页加载 - 示例：传多个字符串参数
var webViewHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  // params内容为  {title: [我是标题哈哈哈], url: [https://www.baidu.com/]}
  String url = params['url']?.first;
  String title = params['title']?.first;
  return WebViewPage(
    url: url,
    title: title,
  );
});

//// 示例：传多个model参数
//var wxSharePayHandler =
//    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
////  print('params: $params');
////  String model = params['userInfoModel']?.first;
////  print('model: $model');
////  // model: {name: yuanzhiying, age: 30, height: 1.78, weight: 74.0}
////  Map<String, dynamic> jsonMap = convert.jsonDecode(model);
////  print('jsonMap: $jsonMap');
////  UserInfoModel _model = UserInfoModel.fromJson(jsonMap);
//
//  UserInfoModel _model1 =
//      UserInfoModel.fromJson(convert.jsonDecode(params['userInfoModel'][0]));
//  UserInfoModel _model2 =
//      UserInfoModel.fromJson(convert.jsonDecode(params['userInfoModel2'][0]));
//
//  return WxSharePage(
//    userInfoModel: _model1,
//    userInfoModel2: _model2,
//  );
//});

//var demoRouteHandler = Handler(
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String message = params["message"]?.first;
//      String colorHex = params["color_hex"]?.first;
//      String result = params["result"]?.first;
//      Color color = Color(0xFFFFFFFF);
//      if (colorHex != null && colorHex.length > 0) {
//        color = Color(ColorHelpers.fromHexString(colorHex));
//      }
//      return DemoSimpleComponent(message: message, color: color, result: result);
//    });
//
//var demoFunctionHandler = Handler(
//    type: HandlerType.function,
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String message = params["message"]?.first;
//      showDialog(
//        context: context,
//        builder: (context) {
//          return AlertDialog(
//            title: Text(
//              "Hey Hey!",
//              style: TextStyle(
//                color: const Color(0xFF00D6F7),
//                fontFamily: "Lazer84",
//                fontSize: 22.0,
//              ),
//            ),
//            content: Text("$message"),
//            actions: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
//                child: FlatButton(
//                  onPressed: () {
//                    Navigator.of(context).pop(true);
//                  },
//                  child: Text("OK"),
//                ),
//              ),
//            ],
//          );
//        },
//      );
//    });
//
///// Handles deep links into the app
///// To test on Android:
/////
///// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
//var deepLinkHandler = Handler(
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String colorHex = params["color_hex"]?.first;
//      String result = params["result"]?.first;
//      Color color = Color(0xFFFFFFFF);
//      if (colorHex != null && colorHex.length > 0) {
//        color = Color(ColorHelpers.fromHexString(colorHex));
//      }
//      return DemoSimpleComponent(
//          message: "DEEEEEP LINK!!!", color: color, result: result);
//    });
