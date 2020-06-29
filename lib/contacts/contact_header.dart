import 'package:flutter/material.dart';
import 'contact_item.dart';

class ContactHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ContactItem(titleName: '新加好友',imagePath: 'images/icon_add friend.png'),
      ContactItem(titleName: '公共聊天室',imagePath: 'images/icon_group.png'),
    ],);
  }
}
