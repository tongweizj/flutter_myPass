import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mypass/config/global.dart';
import 'package:mypass/ui/home/home_view.dart';
import 'package:mypass/ui/style/style.dart';
import 'package:mypass/core/utils/firebase.dart';
import 'package:mypass/ui/login/login.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key, this.title = ''}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  /// 启动页配置
  @override
  void initState() {
    super.initState();

    /// 初始化firebase
    FirebaseUtil().initFirebase(context);

    /// 三秒后跳转到引导页
    Timer(Duration(seconds: 2), () {
      /// 展示状态栏
      SystemChrome.setEnabledSystemUIOverlays(
          [SystemUiOverlay.bottom, SystemUiOverlay.top]);

      /// 自动跳转引导页
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Global.isLogin == false ? LoginPage() : HomePage()));
    });
  }

  /// 页面组件容器
  Widget _buildPageStructure() {
    return Container(
      width: 338.w,
      margin: EdgeInsets.only(top: (40 + 44.0).h), // 顶部系统栏 44px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 157.h,
            width: 338.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Image.asset(
              "assets/images/launch-logo.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 115.h),
            child: Text(
              "小熊帮你保管小钥匙",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: StyleColors.appColorSecond,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 24,
                height: 1,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "这下好了，所有的蜂蜜都保管好了！",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: StyleColors.appTextSecond,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageStructure(),
    );
  }
}
