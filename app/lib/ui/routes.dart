import 'package:mypass/ui/views/add_pass/add_pass.dart';
import 'package:mypass/ui/views/edit_pass/edit_pass.dart';
import 'package:mypass/ui/views/home_view.dart';
import 'package:mypass/ui/views/launch/launch.dart';
import 'package:mypass/ui/views/login/login.dart';
import 'package:mypass/ui/views/pass_detail/pass_detail.dart';

/// 静态路由
var staticRoutes = {
  "/launch": (context) => LaunchPage(), // 登录
  "/home": (context) => HomePage(), // 登录
  "/add_pass": (context) => AddPassPage(), //
  "/pass": (context) => PassDetailPage(), //
  "/edit_pass": (context) => EditPassPage(), //
  "/login": (context) => LoginPage(), // 登录
};
