import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../chat/message_page.dart';
import '../contacts/contacts.dart';
import '../personal/personal.dart';
import '../main.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //当前页面选中索引
  var _currentIndex = 0;

  //聊天页面
  MessagePage message;

  //好友页面
  Contacts contacts;

  //我的页面
  Personal personal;

  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (message == null) {
          message = new MessagePage();
        }
        return message;
      case 1:
        if (contacts == null) {
          contacts = new Contacts();
        }
        return contacts;
      case 2:
        if (personal == null) {
          personal = new Personal();
        }
        return personal;
      default:
    }
  }

  //渲染某个菜单，传入菜单标题，图片路径或图表
  _popupMenuItem(String title, {String imagePath, IconData iconData}) {
    return PopupMenuItem(
        child: Row(
      children: <Widget>[
        imagePath != null
            ? Image.asset(
                imagePath,
                width: 32.0,
                height: 32.0,
              )
            : SizedBox(
                width: 32.0,
                height: 32.0,
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
        Container(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('即时通讯'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              //跳转
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                //弹出菜单
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                    items: <PopupMenuItem>[
                      _popupMenuItem('发起会话', imagePath: 'images/menu.png'),
                      _popupMenuItem('添加好友', imagePath: 'images/menu.png'),
                      _popupMenuItem('联系客服', iconData: Icons.person),
                    ]);
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: ((index) {
            setState(() {
              _currentIndex = index;
            });
          }),
          //底部导航按钮
          items: [
            //导航按钮传入文本和图标
            new BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? Image.asset(
                      'images/icon_tab_message_pre.png',
                      width: 32.0,
                      height: 28.0,
                    )
                  : Image.asset(
                      'images/message (2).png',
                      width: 32.0,
                      height: 28.0,
                    ),
              title: Text(
                '聊天',
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Color(0xFF46C01b)
                        : Color(0xff999999)),
              ),
            ),
            new BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? Image.asset(
                      'images/contacts-fill.png',
                      width: 32.0,
                      height: 28.0,
                    )
                  : Image.asset(
                      'images/contacts-line.png',
                      width: 32.0,
                      height: 28.0,
                    ),
              title: Text(
                '好友',
                style: TextStyle(
                    color: _currentIndex == 1
                        ? Color(0xFF46C01b)
                        : Color(0xff999999)),
              ),
            ),
            new BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? Image.asset(
                      'images/profile selected.png',
                      width: 32.0,
                      height: 28.0,
                    )
                  : Image.asset(
                      'images/profile-no circle.png',
                      width: 32.0,
                      height: 28.0,
                    ),
              title: Text(
                '我的',
                style: TextStyle(
                    color: _currentIndex == 2
                        ? Color(0xFF46C01b)
                        : Color(0xff999999)),
              ),
            ),
          ]),
      body: currentPage(),
    );
  }
}
