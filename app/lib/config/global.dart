import 'package:flutter/material.dart';
import 'package:mypass/config/setting.dart';
import 'package:mypass/config/storage.dart';
import 'package:mypass/core/entitys/cipher.dart';
import 'package:mypass/core/utils/storage.dart';
import 'package:mypass/core/view_models/user_model.dart';

/// 全局配置
class Global {
  /// 用户是否登录
  /// false = 没有登录
  /// true = 登录
  static bool isLogin = false;

  /// 用户登录认证字符串
  static String userID = '';
  // static String credential = '';
  // static String encryptKey = '';
  static CipherEntity cipher = CipherEntity(
    credential: '',
    encryptKey: '',
  );

  /// 用户配置
  // static UserLoginResponseEntity profile = UserLoginResponseEntity();

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // 工具初始
    await StorageUtil.init();

    // 设备日常启动时知行

    // 读取用户是否已经登陆
    isLogin = StorageUtil().getBool(STORAGE_USER_ALREADY_LOGIN_KEY);
    // 获取用户id
    if (isLogin == true) {
      userID = StorageUtil().getStr(STORAGE_USER_USER_ID_KEY);
    }
  }

  // 持久化 用户信息
  // static Future<bool> saveProfile(UserLoginResponseEntity userResponse) {
  //   profile = userResponse;
  //   return StorageUtil()
  //       .setJSON(STORAGE_USER_PROFILE_KEY, userResponse.toJson());
  // }

  // 持久化 加密信息信息
  static Future<bool> saveCipher(CipherEntity cipher) {
    cipher = cipher;
    return StorageUtil().setJSON(STORAGE_USER_CIPHER_KEY, cipher);
  }
}
