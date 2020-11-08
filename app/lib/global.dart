import 'dart:io';

import 'package:mypass/core/entitys/cipher.dart';
import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/core/utils/utils.dart';
import 'package:mypass/core/values/values.dart';
import 'package:flutter/material.dart';

/// 全局配置
class Global {
  /// 用户配置
  static UserLoginResponseEntity profile = UserLoginResponseEntity();

  /// 用户登录认证字符串
  // static String credential = '';
  // static String encryptKey = '';
  static CipherEntity cipher = CipherEntity();

  /// 发布渠道
  static String channel = "xiaomi";

  /// 是否 ios
  static bool isIOS = Platform.isIOS;

  // /// android 设备信息
  // static AndroidDeviceInfo androidDeviceInfo;

  // /// ios 设备信息
  // static IosDeviceInfo iosDeviceInfo;

  // /// 包信息
  // static PackageInfo packageInfo;

  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否离线登录
  static bool isOfflineLogin = false;

  // /// 应用状态,
  // static AppState appState = AppState();

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // 读取设备信息
    // DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    // if (Global.isIOS) {
    //   Global.iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    // } else {
    //   Global.androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    // }

    // 包信息
    // Global.packageInfo = await PackageInfo.fromPlatform();

    // 工具初始
    await StorageUtil.init();
    // HttpUtil();

    // 读取设备第一次打开
    isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    // 读取离线用户信息
    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);

    if (_profileJSON != null) {
      profile = UserLoginResponseEntity.fromJson(_profileJSON);
      isOfflineLogin = true;
    }
    // 读取离线加密信息信息
    var _cipherJSON = StorageUtil().getJSON(STORAGE_USER_CIPHER_KEY);

    if (_cipherJSON != null) {
      cipher = CipherEntity.fromJson(_cipherJSON);
      isOfflineLogin = true;
    }
    // android 状态栏为透明的沉浸
    // if (Platform.isAndroid) {
    //   SystemUiOverlayStyle systemUiOverlayStyle =
    //       SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    // }
  }

  // 持久化 用户信息
  static Future<bool> saveProfile(UserLoginResponseEntity userResponse) {
    profile = userResponse;
    return StorageUtil()
        .setJSON(STORAGE_USER_PROFILE_KEY, userResponse.toJson());
  }

  // 持久化 加密信息信息
  static Future<bool> saveCipher(CipherEntity cipher) {
    cipher = cipher;
    return StorageUtil().setJSON(STORAGE_USER_CIPHER_KEY, cipher);
  }
}
