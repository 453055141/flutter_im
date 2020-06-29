class ContactVo {
  //字母排列值
  String seationKey;

  //名称
  String name;

  //头像地址
  String avatarUrl;

  ContactVo(this.seationKey, this.name, this.avatarUrl);
}

List<ContactVo> contactVos = [
  new ContactVo('A', '阿福', 'images/photo/5.jpg'),
  new ContactVo('A', '阿花', 'images/photo/6.jpg'),
  new ContactVo('Y', '一休哥', 'images/photo/1.png'),
  new ContactVo('Z', '曾凯', 'images/photo/7.jpg'),
];