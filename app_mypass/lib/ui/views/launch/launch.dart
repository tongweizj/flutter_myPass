import 'package:app_mypass/core/utils/utils.dart';
import 'package:app_mypass/core/values/values.dart';
import 'package:app_mypass/ui/shared/shared.dart';
import 'package:app_mypass/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LaunchPage extends StatefulWidget {
  LaunchPage({Key key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  ///////////////////////////////

  // logo
  Widget _buildLogo() {
    return Container(
      width: duSetWidth(338),
      margin: EdgeInsets.only(top: duSetHeight(40 + 44.0)), // 顶部系统栏 44px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: duSetWidth(157),
            width: duSetWidth(338),
            margin: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
            child: Image.asset(
              "assets/images/launch-logo.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(115)),
            child: Text(
              "小熊帮你保管小钥匙",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appColorSecond,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "这下好了，所有的蜂蜜都保管好了！",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: appTextSecond,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(14),
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildbuttonList() {
    return Container(
      width: duSetWidth(295),
      // height: 204,
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: Column(
        children: [
          // TODO：注册页面
          // btnFlatButtonWidget(
          //   onPressed: () {
          //     Navigator.pushNamed(
          //       context,
          //       "/home",
          //     );
          //   },
          //   gbColor: appColorFirst,
          //   title: "开始使用",
          // ),
          SizedBox(height: 10),
          btnFlatButtonWidget(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/login",
              );
            },
            gbColor: appColorThird,
            fontColor: appColorFirst,
            title: "登录",
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 高度去掉 顶部、底部 导航
    ScreenUtil.init(context,
        width: 375, height: 812 - 44 - 34, allowFontScaling: true);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: appBgFivth,
        child: Column(
          children: <Widget>[
            _buildLogo(),
            Spacer(),
            _buildbuttonList(),
            SizedBox(height: duSetHeight(40)),
          ],
        ),
      ),
    );
  }
}
