import 'package:flutter/material.dart';
import './message_data.dart';
import './message_item.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount:messageData.length,itemBuilder: (BuildContext context,int index){
        //传入messageData返回列表项
        return new MessageItem(messageData[index]);
      }),
    );
  }
}
