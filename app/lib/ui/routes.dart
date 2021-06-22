import 'package:mypass/ui/home/home_view.dart';
import 'package:mypass/ui/launch/launch.dart';
import 'package:mypass/ui/login/login.dart';
import 'package:mypass/ui/pass_add/add_pass.dart';
import 'package:mypass/ui/pass_detail/pass_detail.dart';
import 'package:mypass/ui/pass_edit/pass_edit.dart';
import 'package:mypass/ui/splash/splash.dart';

/// 静态路由
var staticRoutes = {
  "/splash": (context) => SplashPage(), // 登录
  "/launch": (context) => LaunchPage(), // 登录
  "/login": (context) => LoginPage(), // 登录
  "/home": (context) => HomePage(), // 登录
  "/add_pass": (context) => AddPassPage(), //
  "/pass": (context) => PassDetailPage(), //
  "/edit_pass": (context) => PassEditPage(), //
};
