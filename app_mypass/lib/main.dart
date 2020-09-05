import 'package:app_mypass/global.dart';
import 'package:app_mypass/ui/routes.dart';
import 'package:app_mypass/ui/views/index/index.dart';

import 'package:flutter/material.dart';

import 'ui/views/launch/launch.dart';

// void main() => runApp(MyApp());
void main() => Global.init().then((e) => runApp(MyApp()));

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
