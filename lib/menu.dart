import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/http/api.dart';
import 'package:flutter_im/http/http_manager.dart';
import 'package:flutter_im/models/menu/continent_and_ocean_entity.dart';

import 'http/http_error.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  var _getListData;
  List<ContinentAndOceanEntity> _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getListData = _getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<ContinentAndOceanEntity>>(
          future: _getListData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (null != snapshot.data) {
                List<ContinentAndOceanEntity> list = snapshot.data;
                return ListView.builder(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 6),
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      _dataList(context, list[index]),
                );
              }
            } else if (snapshot.hasError) {
              return Center(child: Text("Error occurs! ${snapshot.error}"));
            } else {
              return Center(
                child: Text('加载中……'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _dataList(BuildContext context, ContinentAndOceanEntity entity) {
    return new Text(entity.name);
  }
}

Future<List<ContinentAndOceanEntity>> _getList() async{
 await HttpManager().get(
      url: API.GET_CONTINENT_OCEAN,
      tag: null,
      successCallback: (data) {
        return _list = data;
      },
      errorCallback: (HttpError error) {});
}
