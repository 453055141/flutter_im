import 'package:flutter/material.dart';
import 'contact_vo.dart';

class ContactItem extends StatelessWidget {
  final ContactVo contactVo;
  final String titleName;
  final String imagePath;

  ContactItem({this.contactVo, this.titleName, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //每条列表底下加一个边框
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 52.0,
      child: FlatButton(
        onPressed: null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //展示头像
            imagePath == null?Image.asset(contactVo.avatarUrl,width: 36.0, height: 36.0):Image.asset(imagePath,
          width: 36.0, height: 36.0),
            Container(
              margin: const EdgeInsets.only(left: 12.0),
              child: Text(
                titleName == null ? contactVo.name ?? '暂时' : titleName,
                style: TextStyle(fontSize: 18.0, color: Color(0xFF353535)),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
