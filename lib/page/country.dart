import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/config/routes.dart';
import 'package:flutter_im/http/api.dart';
import 'package:flutter_im/http/http_manager.dart';
import 'package:flutter_im/models/menu/countrys_entity.dart';

class CountryPage extends StatefulWidget {
  //大区ID
  final String regionalsId;

  const CountryPage({Key key, @required this.regionalsId}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  Future<List<CountrysEntity>> _getList() async {
    List<dynamic> list = await HttpManager().getAsync(
        url: API.GET_COUNTRYS, params: {"id": widget.regionalsId}, tag: null);
    List<CountrysEntity> listEntity =
        list.map((e) => CountrysEntity().fromJson(e)).toList();
    return listEntity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('请选择国家'),
      ),
      body: SafeArea(
        child: FutureBuilder<List<CountrysEntity>>(
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
                      List<CountrysEntity> list = snapshot.data;
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

  Widget _dataList(BuildContext context, CountrysEntity entity) {
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
//          Routes.navigateTo(
//            context,
//            Routes.countryPage,
//            params: {
//              'regionalsId': entity.id,
//            },
//          );
        },
      ),
    );
  }
}
