import 'package:app_mypass/page/add_pass/add_pass.dart';
import 'package:app_mypass/page/edit_pass/edit_pass.dart';
import 'package:app_mypass/page/home/home.dart';
import 'package:app_mypass/page/launch/launch.dart';
import 'package:app_mypass/page/pass_detail/pass_detail.dart';

/// 静态路由
var staticRoutes = {
  "/launch": (context) => LaunchPage(), // 登录
  "/home": (context) => HomePage(), // 登录
  "/add_pass": (context) => AddPassPage(), //
  "/pass": (context) => PassDetailPage(), //
  "/edit_pass": (context) => EditPassPage(), //
};
