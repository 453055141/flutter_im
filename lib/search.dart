import 'package:flutter/material.dart';
import 'package:flutter_im/config/routes.dart';
import './common/touch_callback.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}




class _SearchState extends State<Search> {
  BuildContext pageContext;

  _SearchState({pageContext});

  //定义焦点节点
  FocusNode focusNode = new FocusNode();

  //请求获取节点
  _requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  //定义一个文本组件
  _getText(String text) {
    return TouchCallBack(
        isfeed: false,
        child: Text(
          text,
          style: TextStyle(fontSize: 14.0, color: Color(0xff1aad19)),
        ),
        onPressed: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 25.0),
        child: Column(
          //水平方向居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
//                TouchCallBack(
//                  child: Container(
//                    height: 45.0,
//                    margin: const EdgeInsets.only(left: 12.0, right: 10.0),
//                    child: Icon(
//                      Icons.chevron_left,
//                      color: Colors.black,
//                    ),
//                  ),
//                  onPressed: () {
//                    Navigator.pop(context);
////                    Routes.navigateTo(context, Routes.login);
//                  },
//                  isfeed: false,
//                ),
                //搜索框容器
                Container(
                  alignment: Alignment.center,
                  height: 45.0,
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  //搜索框底部边框
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.green),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        focusNode: _requestFocus(),
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                        onChanged: (String text) {},
                        decoration: InputDecoration(
                            hintText: '搜索', border: InputBorder.none),
                      )),
                      //添加麦克风图标
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.mic,
                          color: Color(0xffaaaaaa),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(margin: const EdgeInsets.only(top: 50.0),
            child: Text('常用搜索',style: TextStyle(fontSize: 16.0,color: Color(0xffb5b5b5)),),),
            Container(padding: const EdgeInsets.all(30.0),
            child: Row(
              //均匀对齐
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _getText('朋友'),
                _getText('聊天'),
                _getText('群组'),
              ],
            ),),
            Padding(padding: const EdgeInsets.only(left: 30.0,right: 30.0),
            child: Row(
              //均匀对齐
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _getText('Flutter'),
                _getText('Dart'),
                _getText('Java'),
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
