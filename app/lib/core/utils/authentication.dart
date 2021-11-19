import 'dart:async';

// import 'package:auto_route/auto_route.dart';
import 'package:mypass/core/utils/storage.dart';
import 'package:mypass/core/values/values.dart';
import 'package:flutter/material.dart';

/// 检查是否有 token
Future<bool> isAuthenticated() async {
  var profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJSON != null ? true : false;
}

/// 删除缓存 token
// Future deleteAuthentication() async {
//   await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
//   Global.profile = null;
// }

/// 重新登录
Future goLoginPage(BuildContext context) async {
  // await deleteAuthentication();
  // ExtendedNavigator.rootNavigator.pushNamedAndRemoveUntil(
  //     Routes.signInPageRoute, (Route<dynamic> route) => false);
}
