import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:mypass/ui/widgets/widgets.dart';
import 'package:mypass/core/view_models/pass_model.dart';
import 'package:mypass/core/values/enums.dart';

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
    // print('admin');
    // print(CipherUtil.encryptUserLoginPassword('tw273634'));
    // var xxxxStr = CipherUtil.encryptPassword(
    //     password: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
    // print(xxxxStr);
    // CipherUtil.decryptPassword(password: xxxxStr);
  }

  // 顶部导航
  Widget _buildAppBar() {
    return passAppBar(
        context: context,
        backgroundColor: appBgPrimary,
        brightness: Brightness.light,
        title: "",
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: appColorFirst,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: appColorFirst,
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
      backgroundColor: appColorThird,
      drawer: AppDrawer(),
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
                      buildPassItemBlock(context, pass),
                      buildDivideritem()
                    ],
                  );
                }).toList(),
              ),
            ),
    );
  }
}
