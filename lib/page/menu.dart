import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_im/config/routes.dart';
import 'package:flutter_im/http/api.dart';
import 'package:flutter_im/http/http_manager.dart';
import 'package:flutter_im/models/menu/continent_and_ocean_entity.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Future<List<ContinentAndOceanEntity>> _getList() async {
    List<dynamic> list =
        await HttpManager().getAsync(url: API.GET_CONTINENT_OCEAN, tag: null);
    List<ContinentAndOceanEntity> listEntity =
        list.map((e) => ContinentAndOceanEntity().fromJson(e)).toList();
    return listEntity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('请选择查看区域'),
      ),
      body: SafeArea(
        child: FutureBuilder<List<ContinentAndOceanEntity>>(
          future: _getList(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('加载中……'),
                );
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                return Center(
                  child: Text('active……'),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(child: Text("Error occurs! ${snapshot.error}"));
                } else {
                  if (snapshot.hasData) {
                    if (null != snapshot.data) {
                      List<ContinentAndOceanEntity> list = snapshot.data;
                      return ListView.builder(
                        padding: EdgeInsets.only(top: 30),
                        itemCount: list.length,
                        itemBuilder: (context, index) =>
                            _dataList(context, list[index]),
                      );
                    }
                  }
                }
            }
            return Center(
              child: Text('加载中……'),
            );
          },
        ),
      ),
    );
  }

  Widget _dataList(BuildContext context, ContinentAndOceanEntity entity) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        splashColor: Colors.blue,
        padding: EdgeInsets.all(10),
        elevation: 6,
        highlightColor: Colors.cyan,
        textColor: Colors.deepOrange,
        child: Text(entity.name, style: TextStyle(fontSize: 20)),
        onPressed: () {
          Routes.navigateTo(
            context,
            Routes.countryPage,
            params: {
              'regionalsId': entity.key,
            },
          );
        },
      ),
    );
  }
}
