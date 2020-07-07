import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  final String title;

  const WebViewPage({Key key, @required this.url, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WebviewScaffold是插件提供的组件，用于在页面上显示一个WebView并加载URL
    return new WebView(
      initialUrl: url,
      //JS执行模式 是否允许JS执行
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
