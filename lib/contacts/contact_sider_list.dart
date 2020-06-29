import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'contact_vo.dart';

//好友列表
class ContactSiderList extends StatefulWidget {
  //好友列表项数据
  final List<ContactVo> items;

  //好友列表头构造器
  final IndexedWidgetBuilder headerBuilder;

  //好友列表项构造器
  final IndexedWidgetBuilder itemBuilder;

  //字母构造器
  final IndexedWidgetBuilder sectionBuilder;

  const ContactSiderList(
      {Key key,
      @required this.items,
      @required this.headerBuilder,
      @required this.itemBuilder,
      @required this.sectionBuilder})
      : super(key: key);

  @override
  _ContactSiderListState createState() => _ContactSiderListState();
}

class _ContactSiderListState extends State<ContactSiderList> {
  //列表滚动控制器
  final ScrollController _scrollController = new ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  //判断并显示头部视图控制器
  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

  //根据定位判断是否显示好友列表头
  bool _shouldShowHeader(int position) {
    if (position <= 0) {
      return false;
    }
    if (position != 0 &&
        widget.items[position].seationKey !=
            widget.items[position - 1].seationKey) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //列表加载更多
          NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
              //滚动控制器
              controller: _scrollController,
              //列表内容不足一屏也能滑动
              physics: const AlwaysScrollableScrollPhysics(),
              //长度
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    //显示列表头
                    _isShowHeaderView(index),
                    //用offstage组件控制是否显示英文字母
                    Offstage(
                      offstage: _shouldShowHeader(index),
                      child: widget.sectionBuilder(context, index),
                    ),
                    Column(
                      children: <Widget>[
                        widget.itemBuilder(context, index),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
