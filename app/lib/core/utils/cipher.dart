import 'dart:typed_data';

import 'package:crypto/crypto.dart';

import 'package:mypass/core/values/setting.dart';
import 'dart:convert';

import 'package:mypass/global.dart';
import 'package:steel_crypt/steel_crypt.dart';

class CipherUtil {
  /// 登陆密码加密
  /// 使用crypto SHA-512
  static String encryptUserLoginPassword(String password) {
    // var key = utf8.encode(CIPHER_KEY);
    // var bytes = utf8.encode(password);
    var hmacSha256 = new Hmac(sha256, utf8.encode(CIPHER_KEY)); // HMAC-SHA256
    var digest = hmacSha256.convert(utf8.encode(password));

    Global.credential = digest.toString();
    Global.encryptKey = base64.encode(digest.bytes);
    return digest.toString();
  }

  /// 加密：用户保存的密码
  /// 使用encrypt aes
  static encryptPassword({String password}) {
    // Key generator
    var keyGen = CryptKey();
    // key32 : 用户登陆密码
    // var key32 = keyGen.genFortuna(len: 32);
    // var key32 = Global.encryptKey;
    // iv : 私钥
    var iv16 = keyGen.genDart(len: 16);

    // generated AES encrypter with key + padding
    var aesMaker = AesCrypt(key: Global.encryptKey, padding: PaddingAES.pkcs7);
    var encrypted = aesMaker.gcm.encrypt(inp: password, iv: iv16);

    /// 加密信息转成str
    final credential = {};
    credential['password'] = encrypted;
    credential['iv'] = iv16;

    AsciiCodec ascStrToBuff = new AsciiCodec();

    /// json.encode(credential); //josn -> str
    /// a.encode(json.encode(credential)); // str -> buff
    final encryptedStr =
        toHexString(ascStrToBuff.encode(json.encode(credential)));

    return encryptedStr;
  }

  /// 解密：用户保存的密码
  static decryptPassword({String password}) {
    // var xxxB = Hex.createUint8ListFromHexString(password);
    // print(xxxB);
    AsciiCodec ascStrToBuff = new AsciiCodec();
    var passwordString =
        ascStrToBuff.decode(Hex.createUint8ListFromHexString(password));
    // print(xxxA);
    var credential = json.decode(passwordString);
    // print(credential);

    //generate iv for AES
    // var iv16 = credential['iv'];
    // generated AES encrypter with key + padding

    var aesMaker = AesCrypt(key: Global.encryptKey, padding: PaddingAES.pkcs7);

    var encrypted =
        aesMaker.gcm.decrypt(enc: credential['password'], iv: credential['iv']);

    return encrypted;
  }

  static String toHexString(bytes) {
    String ret = '';
    for (int i = 0; i < bytes.length; i++) {
      ret += bytes[i].toRadixString(16).padLeft(2, '0');
    }
    return ret;
  }
}

class Hex {
  /// Creates a `Uint8List` by a hex string.
  static Uint8List createUint8ListFromHexString(String hex) {
    if (hex == null) throw new ArgumentError("hex is null");

    var result = new Uint8List(hex.length ~/ 2);
    for (var i = 0; i < hex.length; i += 2) {
      var num = hex.substring(i, i + 2);
      var byte = int.parse(num, radix: 16);
      result[i ~/ 2] = byte;
    }

    return result;
  }

  /// Returns a hex string by a `Uint8List`.
  static String formatBytesAsHexString(Uint8List bytes) {
    if (bytes == null) throw new ArgumentError("The list is null");

    var result = new StringBuffer();
    for (var i = 0; i < bytes.lengthInBytes; i++) {
      var part = bytes[i];
      result.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
    }

    return result.toString();
  }
}
