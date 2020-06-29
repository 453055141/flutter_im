import 'package:flutter/material.dart';
import 'package:flutter_im/config/application.dart';
import 'package:flutter_im/config/routes.dart';
import 'touch_callback.dart';

class ImItem extends StatelessWidget {
  //标题
  final String title;

  //图片
  final String imagePath;

  //图标
  final Icon icon;

  const ImItem({Key key, @required this.title, this.imagePath, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
        child: Container(
          height: 50.0,
          child: Row(
            children: <Widget>[
              Container(
                child: imagePath != null
                    ? Image.asset(
                        imagePath,
                        width: 32.0,
                        height: 32.0,
                      )
                    : SizedBox(
                        height: 32.0,
                        width: 32.0,
                        child: icon,
                      ),
                margin: const EdgeInsets.only(left: 22.0, right: 20.0),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
              )
            ],
          ),
        ),
        onPressed: () {
          //判断点击的项
          switch (title) {
            case '好友动态':
              Routes.navigateTo(context, Routes.friends, params: {
                'title': "flutter",
                'url': "https://flutter.io/",
              });
//              Navigator.pushNamed(context, '/friends');
              break;
            case '联系客服':
              break;
          }
        });
  }
}
