import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mypass/ui/style/style.dart';

Widget buildPassButton() {
  return Center(
      child: Column(children: <Widget>[
    Divider(
      height: 3.h,
    ),
    Container(
      color: StyleColors.appBgFifth,
      height: 40.h,
      width: 375.w,
      padding: EdgeInsets.all(0),
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
          style: TextStyle(fontSize: 14.sp),
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
//           height: 3),
//         ),
//         Container(
//           color: appBgFifth,
//           height: 40),
//           width: duSetWidth(375),
//           padding: EdgeInsets.only(
//               left: duSetWidth(20),
//               right: duSetWidth(0),
//               bottom: 0),
//               top: 15)),
//           child: Text(
//             header,
//             textAlign: TextAlign.left,
//             style: TextStyle(
//               fontSize: 14),
//               color: appTextFurth,
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }
