// import 'package:flutter/material.dart';
import 'package:mypass/core/utils/cipher.dart';
import "dart:typed_data";
import 'dart:convert';
import 'package:test/test.dart';
// import "package:cipher/cipher.dart";
// import "package:cipher/impl/base.dart";

// Uint8List StringToUint8List(String s) {
//   var ret = new Uint8List(s.length);
//   for (var i = 0; i < s.length; i++) {
//     ret[i] = s.codeUnitAt(i);
//   }
//   return ret;
// }

// /// UTF16 Decoding
// String Uint8ListToString(Uint8List ui) {
//   String s = new String.fromCharCodes(ui);
//   return s;
// }

// // void main() {
// //   // String temp = CipherUtil.encryptUserLoginPassword('1234565');
// //   // print(temp);
// //   // CipherUtil.encryptPassword('1234565');
// // }
// void main() {
//   initCipher();
//   final testStr =
//       "Hello, i am a very very very very very very very very long string, please encrypte me";
//   final ivStr = "2urPAr4H"; // Need to have size 8
//   final keyStr = "QuJuesMhcssE4e8Q4Kt1XCJW3tcpzcEI"; // Need to have size 32

//   final _ivEncoded = UTF8.encode(ivStr);
//   final _keyEncoded = UTF8.encode(keyStr);
//   final _key = new KeyParameter(_keyEncoded);
//   final params = new ParametersWithIV(_key, _ivEncoded);

//   var cipher = new StreamCipher("Salsa20");
//   cipher
//     ..reset()
//     ..init(true, params);
//   var encryptedEncodedData = cipher.process(StringToUint8List(testStr));
//   var encryptedDataStr = Uint8ListToString(encryptedEncodedData);

//   cipher
//     ..reset()
//     ..init(false, params);
//   var dencryptedEncodedData =
//       cipher.process(StringToUint8List(encryptedDataStr));
//   var dencryptedDataStr = Uint8ListToString(dencryptedEncodedData);
//   //expect(testStr, dencryptedDataStr);
// }
void main() {
  test('测试 解密', () async {
    var pass = '123456';
    var decodePass = CipherUtil.encryptPassword(password: pass);
    print(decodePass);
    expect(decodePass, 'max@luci.ai');
  });

  // test('测试 解密', () async {
  //   var pass =
  //       '7b2270617373776f7264223a22356d652b624c70455a75535a582b6e593331496637513d3d222c226976223a223767594b36546b705062327733716a795872715170673d3d227d';
  //   var decodePass = CipherUtil.decryptPassword(password: pass);
  //   print(decodePass);

  //   expect(decodePass, 'max@luci.ai');
  // });
}
