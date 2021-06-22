import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mypass/ui/style/style.dart';
import 'components/buildBrand.dart';
import 'components/email_password_form.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// 页面组件容器
  Widget _buildPageStructure() {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: Scaffold(
                backgroundColor: StyleColors.appBgFivth, //把scaffold的背景色改成透明
                body: SingleChildScrollView(
                    child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 80.h,
                      ),
                      buildBrandInfo(),
                      SizedBox(
                        height: 70.h,
                      ),
                      EmailPasswordForm(),
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
