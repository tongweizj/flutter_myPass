import 'package:app_mypass/common/utils/utils.dart';
import 'package:app_mypass/common/values/values.dart';
import 'package:flutter/material.dart';

Widget buildPassButton() {
  return Center(
      child: Column(children: <Widget>[
    Divider(
      height: duSetHeight(3),
    ),
    Container(
      color: appBgFifth,
      height: duSetHeight(40),
      width: duSetWidth(375),
      padding: EdgeInsets.only(
          left: duSetWidth(0),
          right: duSetWidth(0),
          bottom: duSetHeight(0),
          top: duSetHeight(0)),
      child: MaterialButton(
        onPressed: () {},
        // color: Colors.blue,
        textColor: appTextThird,
        minWidth: 30,
        height: 0,
        padding: EdgeInsets.zero,
        child: Text(
          '生成密码',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: duSetFontSize(14)),
        ),
      ),
    )
  ]));
}

// Widget _buildBlockHeader(String header) {
//   return Center(
//     child: Column(
//       children: <Widget>[
//         Divider(
//           height: duSetHeight(3),
//         ),
//         Container(
//           color: appBgFifth,
//           height: duSetHeight(40),
//           width: duSetWidth(375),
//           padding: EdgeInsets.only(
//               left: duSetWidth(20),
//               right: duSetWidth(0),
//               bottom: duSetHeight(0),
//               top: duSetHeight(15)),
//           child: Text(
//             header,
//             textAlign: TextAlign.left,
//             style: TextStyle(
//               fontSize: duSetFontSize(14),
//               color: appTextFurth,
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }
