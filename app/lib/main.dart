import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mypass/global.dart';
import 'package:mypass/core/view_models/pass_model.dart';
import 'package:mypass/core/view_models/user_model.dart';
import 'core/view_models/pass_detail_model.dart';
import 'package:mypass/ui/routes.dart';
import 'package:mypass/ui/views/index/index.dart';

// void main() => runApp(MyApp());
void main() => Global.init().then((e) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PassModel()),
          ChangeNotifierProvider(create: (_) => UserModel()),
          ChangeNotifierProvider<PassDetailModel>(
            // 等使用时，再创建
            create: (_) => PassDetailModel(),
          ),
        ],
        child: MyApp(),
      ),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ducafecat.tech',
      home: IndexPage(),
      routes: staticRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
