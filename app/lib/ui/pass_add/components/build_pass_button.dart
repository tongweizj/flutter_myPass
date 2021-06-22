import 'package:flutter/material.dart';
import 'package:mypass/ui/style/style.dart';

Widget buildPassButton() {
  return Center(
      child: Column(children: <Widget>[
    Divider(
      height: duSetHeight(3),
    ),
    Container(
      color: StyleColors.appBgFifth,
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
        textColor: StyleColors.appTextThird,
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
