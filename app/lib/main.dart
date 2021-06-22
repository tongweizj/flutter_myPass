import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mypass/config/global.dart';
import 'package:mypass/provider_setup.dart';
import 'package:mypass/ui/routes.dart';
import 'package:mypass/ui/splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await FirebaseAuth.instance.useEmulator('http://192.168.1.106:9099');
  Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: ScreenUtilInit(
            designSize:
                Platform.isIOS == true ? Size(375, 667) : Size(375, 667),
            builder: () => MaterialApp(
                  title: 'yoese.com',
                  home: SplashPage(),
                  routes: staticRoutes,
                  debugShowCheckedModeBanner: false,
                )));
  }
}
