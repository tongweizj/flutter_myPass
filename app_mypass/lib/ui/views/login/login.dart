// import 'dart:convert';

import 'package:app_mypass/core/api/apis.dart';
import 'package:app_mypass/core/entitys/entitys.dart';
import 'package:app_mypass/core/utils/utils.dart';
import 'package:app_mypass/core/utils/validator.dart';
import 'package:app_mypass/core/values/values.dart';
import 'package:app_mypass/ui/shared/shared.dart';
import 'package:app_mypass/ui/widgets/widgets.dart';
import 'package:app_mypass/global.dart';
import 'package:app_mypass/ui/views/login/components/app_bar.dart';
import 'package:app_mypass/ui/views/login/components/button.dart';
import 'package:app_mypass/ui/views/login/components/input.dart';
import 'package:flutter/material.dart';
// import 'package:luci_thermal_personal_app/core/api/apis.dart';

// import 'package:luci_thermal_personal_app/global.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //email的控制器
  final TextEditingController _emailController = TextEditingController();
  //密码的控制器
  final TextEditingController _passController = TextEditingController();

  // 执行登录操作
  _handleLogin() async {
    /// 1. 表单数据校验
    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: 'Please check your email!');
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: 'Please check your password!');
      return;
    }

    /// 2.登录
    UserLoginRequestEntity variables = UserLoginRequestEntity(
      identifier: _emailController.value.text,
      password: _passController.value.text,
      // password: duSHA256(_passController.value.text),
    );
    try {
      UserLoginResponseEntity userProfile = await GqlUserAPI.login(
        context: context,
        variables: variables,
      );
      Global.saveProfile(userProfile);
      Navigator.pushNamed(
        context,
        "/home",
      );
    } catch (e) {
      print(e);
      return toastInfo(msg: '请正确输入账号、密码！');
    }
  }

  //////////////////////////////////

  // Brand Information block
  Widget _buildBrandInfo() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(44.0)), // 顶部系统栏 44px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // logoBig(),
          // appSlogan(),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    // String _password;
    // final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
    return Container(
      width: duSetWidth(375),
      height: duSetHeight(350),
      margin: EdgeInsets.only(top: duSetHeight(80)),
      padding: EdgeInsets.only(
        top: duSetHeight(40),
        left: duSetWidth(32),
        right: duSetWidth(32),
      ),
      // decoration: BoxDecoration(
      //   color: AppColors.primaryBackground,
      // ),
      child: Column(
        children: [
          // email input
          inputEmailEdit(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            marginTop: 0,
          ),
          // password input
          InputPassword(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            isPassword: true,
          ),

          // 登录按钮
          btnFlatIconButtonWidget(
            onPressed: () => _handleLogin(),
            width: 260,
            height: 45,
            marginTop: 45,
            gbColor: appBgSec,
            iconFileName: "secure_login",
          ),
          // Spacer(),
        ],
      ),
    );
  }

  /// 页面组件容器
  Widget _buildPageStructure() {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: Scaffold(
                backgroundColor: appBgSec, //把scaffold的背景色改成透明
                appBar: secondAppBar(
                  context: context,
                ),
                body: SingleChildScrollView(
                    child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height),
                  child: Column(
                    children: <Widget>[
                      _buildBrandInfo(),
                      _buildInputForm(),
                      Spacer(),
                      // _buildPageFooter(),
                    ],
                  ),
                ))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPageStructure();
  }
}
