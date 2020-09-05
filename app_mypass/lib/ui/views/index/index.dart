import 'package:app_mypass/global.dart';
import 'package:app_mypass/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_mypass/ui/views/launch/launch.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375,
      height: 812 - 44 - 34,
      allowFontScaling: true,
    );

    /// test
    ///
    // print(Global.eventList.events.toString());
    // // Global.eventList.events.sort((a, b) => (b.date).compareTo(a.date));
    // print(Global.eventList.events.toString());

    /// Index 说明
    /// 如果 Global.isOfflineLogin == true，即用户已经登录了，跳转首页
    /// 否则，跳转launch页
    ///
    //    return Scaffold(
    //   body: Global.isOfflineLogin == true ? ApplicationPage() : LaunchPage(),
    // );
    return Scaffold(
      body: Global.isOfflineLogin == true ? HomePage() : LaunchPage(),
    );
  }
}
