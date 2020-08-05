import 'package:app_mypass/global.dart';
import 'package:app_mypass/routes.dart';
import 'package:flutter/material.dart';

import 'page/launch/launch.dart';

// void main() => runApp(MyApp());
void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ducafecat.tech',
      home: LaunchPage(),
      routes: staticRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
