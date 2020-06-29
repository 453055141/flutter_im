import 'package:flutter/material.dart';
import '../common/touch_callback.dart';
import '../common/im_item.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          //头像部分
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            height: 80.0,
            child: TouchCallBack(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //添加头像
                    Container(
                      margin: const EdgeInsets.only(left: 12.0, right: 15.0),
                      child: Image.asset(
                        'images/photo/1.png',
                        width: 70.0,
                        height: 70.0,
                      ),
                    ),
                    //用户名及账号显示
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '一休',
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xFF353535)),
                          ),
                          Text(
                            '账号 yixiu',
                            style: TextStyle(
                                fontSize: 14.0, color: Color(0xFFa9a9a9)),
                          ),
                        ],
                      ),
                    ),
                    //二维码显示
                    Container(
                      margin: const EdgeInsets.only(left: 12.0, right: 15.0),
                      child: Image.asset(
                        'images/二维码.png',
                        width: 24.0,
                        height: 24.0,
                      ),
                    ),
                  ],
                ),
                onPressed: null),
          ),
          //列表项 使用IMItem渲染
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: ImItem(
              title: '好友动态',
              imagePath: 'images/好友动态.png',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ImItem(
                  title: '消息管理',
                  imagePath: 'images/message.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),
                ),
                ImItem(
                  title: '我的相册',
                  imagePath: 'images/相册.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),
                ),
                ImItem(
                  title: '我的文件',
                  imagePath: 'images/文件.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),
                ),
                ImItem(
                  title: '联系客服',
                  imagePath: 'images/ic_me_service.png',
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: ImItem(title: '清理缓存',imagePath: 'images/清理.png',),
          ),
        ],
      ),
    );
  }
}
