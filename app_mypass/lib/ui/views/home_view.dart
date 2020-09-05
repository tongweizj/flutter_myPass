import 'package:app_mypass/core/api/apis.dart';
import 'package:app_mypass/core/entitys/entitys.dart';
import 'package:app_mypass/ui/shared/shared.dart';
import 'package:app_mypass/ui/widgets/home.dart';
import 'package:app_mypass/ui/widgets/widgets.dart';
import 'package:app_mypass/global.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PasswordsListResponseEntity _passList;
  void initState() {
    super.initState();

    _loadAllData();
    // _loadEventData();
  }

  // 读取所有数据
  _loadAllData() async {
    /// 2.登录

    try {
      /// api获取用户密码列表
      _passList = await GqlPasswordAPI.getUserPasswordList(
        context: context,
        params: {"username": Global.profile.user.username},
      );

      /// 保存用户密码列表
      // Global.saveProfile(userProfile);
    } catch (e) {
      print(e);
      return toastInfo(msg: 'bug！');
    }
    print(_passList);

    if (mounted) {
      setState(() {});
    }
  }

  // 顶部导航
  Widget _buildAppBar() {
    return secondAppBar(
        context: context,
        title: Text(
          "主页",
          style: TextStyle(
            color: appTextThird,
            fontFamily: 'Montserrat',
            fontSize: duSetFontSize(14.0),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.notifications_none,
            color: appiconSecond,
          ),
          iconSize: 28,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: appiconFirst,
            ),
            iconSize: 28,
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/add_pass",
              );
            },
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _passList.appPasswords == null
          ? Container()
          : SingleChildScrollView(
              child: Column(
                children: _passList.appPasswords.map((pass) {
                  return Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      buildPassItem(context, pass),
                      buildDivider()
                    ],
                  );
                }).toList(),
              ),
            ),
    );
  }
}
