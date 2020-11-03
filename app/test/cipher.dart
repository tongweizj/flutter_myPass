// // import 'package:mypass/core/utils/cipher.dart';
// import "dart:typed_data";
// import 'dart:convert';
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
