import 'package:flutter/material.dart';
import './message_data.dart';
import '../common/touch_callback.dart';
import 'package:date_format/date_format.dart';

class MessageItem extends StatelessWidget {
  final MessageData messageData;

  const MessageItem(this.messageData);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //只加底部边
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 64.0,
      //按下回调处理空实现
      child: TouchCallBack(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //展示头像
              Container(
                //头像左右留一定边距
                margin: const EdgeInsets.only(left: 13.0, right: 13.0),
                child: Image.asset(
                  messageData.avatar,
                  width: 48.0,
                  height: 48.0,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      messageData.title,
                      style:
                          TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
                      maxLines: 1,
                    ),
                    Padding(padding: const EdgeInsets.only(top: 8.0)),
                    Text(
                      messageData.subTitle,
                      style:
                          TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                //时间顶部对齐
                alignment: AlignmentDirectional.topStart,
                margin: const EdgeInsets.only(right: 12.0, top: 12.0),
                child: Text(
                  //时间格式化
                  formatDate(messageData.time, [HH, ':', nn, ':', 'ss'])
                      .toString(),
                  style: TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                ),
              ),
            ],
          ),
          onPressed: null),
    );
  }
}
