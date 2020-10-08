import 'package:app_mypass/core/api/apis.dart';
import 'package:app_mypass/core/entitys/entitys.dart';
import 'package:app_mypass/core/enums/viewstate.dart';
import 'package:app_mypass/core/view_models/pass_model.dart';
import 'package:app_mypass/ui/shared/shared.dart';
import 'package:app_mypass/ui/widgets/home.dart';
import 'package:app_mypass/ui/widgets/widgets.dart';
import 'package:app_mypass/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // PasswordsListResponseEntity _passList;

  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1)).then((e) {
      context.read<PassModel>().getPasswordList(context);
    });
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
    // context.read<PassModel>().getPasswordList(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: context.watch<PassModel>().state == ViewState.Busy
          ? Container()
          : SingleChildScrollView(
              child: Column(
                children: context
                    .watch<PassModel>()
                    .passList
                    .appPasswords
                    .map((pass) {
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
