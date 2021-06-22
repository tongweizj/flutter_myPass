import 'package:flutter/material.dart';
import 'package:mypass/config/global.dart';
import 'package:mypass/core/view_models/pass_detail_model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'package:mypass/config/enums.dart';
import 'package:mypass/core/entitys/passwords.dart';
import 'package:mypass/core/view_models/pass_model.dart';
import 'package:mypass/core/view_models/user_model.dart';
import 'package:mypass/ui/style/style.dart';
import 'package:mypass/ui/widgets/divider_widgets.dart';
import 'package:mypass/ui/widgets/drawer.dart';

import 'components/home_page_widget.dart';
import 'components/appBar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    context.read<UserModel>().initUserDB(context, Global.userID);

    /// 从firebase中拉取密码列表
    Future.delayed(Duration(milliseconds: 1)).then((e) {
      context.read<PassModel>().getPasswordList(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    context.read<PassModel>().passwordSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: StyleColors.appColorThird,
      drawer: AppDrawer(),
      body: context.watch<PassModel>().state == ViewState.Busy
          ? Container()
          : Container(
              child: FirebaseAnimatedList(
                key: ValueKey<bool>(false),
                query: context.watch<UserModel>().passwordRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  snapshot.value['id'] = snapshot.key;
                  // print(snapshot.value);
                  return SizeTransition(
                      sizeFactor: animation,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10),
                          buildPassItemBlock(
                              context,
                              AppPasswordModel.fromJson(
                                  Map<String, dynamic>.from(snapshot.value))),
                          buildDivideritem()
                        ],
                      ));
                },
              ),
            ),
    );
  }
}
