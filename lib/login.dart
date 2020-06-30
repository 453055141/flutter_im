import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/config/routes.dart';
import 'package:flutter_im/helpers/base_resp.dart';
import 'package:flutter_im/utils/http_util.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'config/application.dart';
import 'config/loading_page.dart';
import 'http/http_error.dart';
import 'http/http_manager.dart';
import 'main.dart';
import 'models/login/login_req_entity.dart';
import 'models/user/user_info_entity.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey();
  String _phone, _name;
  bool _isObscure = true;
  Color _eyeColor;
  List _loginMethod = [
    {"title": "facebook", "icon": MdiIcons.facebook},
    {
      "title": "google",
      "icon": MdiIcons.google,
    },
    {
      "title": "twitter",
      "icon": MdiIcons.twitter,
    },
  ];

  ProgressDialog pr;

  @override
  Widget build(BuildContext context) {

    pr = new ProgressDialog(context);
    pr.style(message: 'Please wait...');
    return new Scaffold(
        body: Form(
            key: _formKey, //设置globalKey，用于后面获取FormState
            autovalidate: true, //开启自动校验
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              children: <Widget>[
                SizedBox(
                  height: kToolbarHeight,
                ),
                buildTitle(),
                buildTitleLine(),
                SizedBox(height: 70.0),
                buildPhoneTextField(context),
                SizedBox(height: 30.0),
                buildNameTextField(context),
//                buildForgetPasswordText(context),
                SizedBox(height: 60.0),
                buildLoginButton(context),
                SizedBox(height: 30.0),
//                buildOtherLoginText(),
//                buildOtherMethod(context),
//                buildRegisterText(context),
              ],
            )));
  }

//  Align buildRegisterText(BuildContext context) {
//    return Align(
//      alignment: Alignment.center,
//      child: Padding(
//        padding: EdgeInsets.only(top: 10.0),
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text('没有账号？'),
//            GestureDetector(
//              child: Text(
//                '点击注册',
//                style: TextStyle(color: Colors.green),
//              ),
//              onTap: () {
//                //TODO 跳转到注册页面
//                print('去注册');
//                Navigator.pop(context);
//              },
//            ),
//          ],
//        ),
//      ),
//    );
//  }

//  ButtonBar buildOtherMethod(BuildContext context) {
//    return ButtonBar(
//      alignment: MainAxisAlignment.center,
//      children: _loginMethod
//          .map((item) => Builder(
//                builder: (context) {
//                  return IconButton(
//                      icon: Icon(item['icon'],
//                          color: Theme.of(context).iconTheme.color),
//                      onPressed: () {
//                        //TODO : 第三方登录方法
//                        Scaffold.of(context).showSnackBar(new SnackBar(
//                          content: new Text("${item['title']}登录"),
//                          action: new SnackBarAction(
//                            label: "取消",
//                            onPressed: () {},
//                          ),
//                        ));
//                      });
//                },
//              ))
//          .toList(),
//    );
//  }

//  Align buildOtherLoginText() {
//    return Align(
//        alignment: Alignment.center,
//        child: Text(
//          '其他账号登录',
//          style: TextStyle(color: Colors.grey, fontSize: 14.0),
//        ));
//  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            'Login',
            style: Theme.of(context).primaryTextTheme.overline,
          ),
          color: Colors.black,
          onPressed: ()  {
           pr.show();
            if ((_formKey.currentState as FormState).validate()) {
//              ///只有输入的内容符合要求通过才会到达此处
              (_formKey.currentState as FormState).save();
              LogUtil.v('phone:$_phone , name:$_name');

//              double percentage = 30.0;
//              print(percentage);
//              pr.update(
//                progress: percentage,
//                message: "Please wait...",
//                progressWidget: Container(
//                    padding: EdgeInsets.all(8.0),
//                    child: CircularProgressIndicator()),
//                maxProgress: 100.0,
//                progressTextStyle: TextStyle(
//                    color: Colors.black,
//                    fontSize: 13.0,
//                    fontWeight: FontWeight.w400),
//                messageTextStyle: TextStyle(
//                    color: Colors.black,
//                    fontSize: 19.0,
//                    fontWeight: FontWeight.w600),
//              );

              LoginReqEntity loginReqEntity = LoginReqEntity();
              loginReqEntity.name = _name;
              loginReqEntity.phone = _phone;
              HttpManager().post(
                url: "/user/login",
                tag: null,
                data: loginReqEntity.toJson(),
                successCallback: (data) {
                  UserInfoEntity userInfoEntity = UserInfoEntity().fromJson(data);
                  SpUtil.putObject("user", userInfoEntity);
                  SpUtil.putString("token", userInfoEntity.token);
                  Application.router.navigateTo(context, Routes.app, clearStack: true);
                },
                errorCallback: (HttpError error) {
//                  Dialog(child: Text(error.toString()),);

//                  LogUtil.v('error:$error');
                },
              );

            }
          },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }

//  Padding buildForgetPasswordText(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.only(top: 8.0),
//      child: Align(
//        alignment: Alignment.centerRight,
//        child: FlatButton(
//          child: Text(
//            '忘记密码？',
//            style: TextStyle(fontSize: 14.0, color: Colors.grey),
//          ),
//          onPressed: () {
//            Navigator.pop(context);
//          },
//        ),
//      ),
//    );
//  }

//  TextFormField buildPasswordTextField(BuildContext context) {
//    return TextFormField(
//      onSaved: (String value) => _password = value,
//      obscureText: _isObscure,
//      validator: (String value) {
//        if (value.isEmpty) {
//          return '请输入密码';
//        }
//      },
//      decoration: InputDecoration(
//          labelText: 'Password',
//          suffixIcon: IconButton(
//              icon: Icon(
//                Icons.remove_red_eye,
//                color: _eyeColor,
//              ),
//              onPressed: () {
//                setState(() {
//                  _isObscure = !_isObscure;
//                  _eyeColor = _isObscure
//                      ? Colors.grey
//                      : Theme.of(context).iconTheme.color;
//                });
//              })),
//    );
//  }

  TextFormField buildNameTextField(BuildContext context) {
    return TextFormField(
      onSaved: (String value) => _name = value,
      decoration: InputDecoration(
        labelText: '第一次使用请设置用户名',
      ),
    );
  }

  TextFormField buildPhoneTextField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '请填写你的手机号',
      ),
      validator: (String value) {
        if (!RegexUtil.isMobileExact(value)) {
          return '请输入正确的手机号';
        }
      },
      onSaved: (String value) => _phone = value,
    );
  }

//  TextFormField buildEmailTextField() {
//    return TextFormField(
//      decoration: InputDecoration(
//        labelText: 'Emall Address',
//      ),
//      validator: (String value) {
//        var emailReg = RegExp(
//            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
//        if (!emailReg.hasMatch(value)) {
//          return '请输入正确的邮箱地址';
//        }
//      },
//      onSaved: (String value) => _email = value,
//    );
//  }

  Padding buildTitleLine() {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, top: 4.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black,
          width: 40.0,
          height: 2.0,
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 42.0),
      ),
    );
  }
}
