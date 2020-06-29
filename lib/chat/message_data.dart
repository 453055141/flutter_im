enum MessageType { SYSTEM, PUBLIC, CHAT, GROUP }

class MessageData {
  //头像
  String avatar;

  //主标题
  String title;

//子标题
  String subTitle;

//消息时间
  DateTime time;

//消息类型
  MessageType type;

  MessageData(this.avatar, this.title, this.subTitle, this.time, this.type);
}

List<MessageData> messageData = [
  new MessageData('images/photo/1.png', '一休哥', '突然想到了！', new DateTime.now(),
      MessageType.CHAT),
  new MessageData('images/photo/2.jpg', '哆啦A梦', '叮当猫去哪了？', new DateTime.now(),
      MessageType.CHAT),
  new MessageData('images/photo/3.jpeg', '一休哥', '突然想到了！', new DateTime.now(),
      MessageType.CHAT),
  new MessageData('images/photo/4.jpg', '哆啦A梦', '叮当猫去哪了？', new DateTime.now(),
      MessageType.CHAT),
];
