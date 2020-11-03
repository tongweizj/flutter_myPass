import 'package:mypass/ui/shared/shared.dart';
import 'package:flutter/material.dart';

/// AppBar
/// leading: 文字
/// actions: 文字
/// 添加、编辑密码
Widget passAppBar(
    {@required BuildContext context,
    String title,
    Widget leading,
    List<Widget> actions,
    Color backgroundColor: appBgFivth,
    Brightness brightness: Brightness.dark}) {
  return AppBar(
    backgroundColor: backgroundColor,
    elevation: 0,
    title: title != null
        ? Center(
            child: Text(
              title,
              style: TextStyle(
                color: appBgPrimary,
                fontFamily: 'Montserrat',
                fontSize: duSetFontSize(16),
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        : null,
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: leading,
    actions: actions,
    brightness: brightness,
  );
}

/// AppBar
// Widget firstAppBar({
//   @required BuildContext context,
//   Widget title,
//   Widget leading,
//   List<Widget> actions,
// }) {
//   return AppBar(
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     title: title != null
//         ? Center(
//             child: title,
//           )
//         : null,
//     leading: leading,
//     actions: actions,
//   );
// }

/// AppBar
/// leading: icon
/// actions:icon
/// 首页、登陆
// Widget secondAppBar({
//   @required BuildContext context,
//   Widget title,
//   Widget leading,
//   List<Widget> actions,
//   Color backgroundColor: appBgFivth,
// }) {
//   return AppBar(
//     backgroundColor: backgroundColor,
//     brightness: Brightness.light,
//     elevation: 0,
//     title: title != null
//         ? Center(
//             child: title,
//           )
//         : null,
//     leading: leading,
//     actions: actions,
//   );
// }

/// 深色背景 AppBar
/// leading: icon
/// actions: 文字
/// 密码详情
// Widget thirdAppBar({
//   @required BuildContext context,
//   Widget title,
//   Widget leading,
//   List<Widget> actions,
// }) {
//   return AppBar(
//     backgroundColor: appBgSeventh,
//     elevation: 0,
//     title: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[leading, title, Spacer()],
//     ),
//     centerTitle: false,
//     automaticallyImplyLeading: false,
//     actions: actions,
//   );
// }

/// AppBar
/// leading: 文字
/// actions: 文字
/// 添加、编辑密码
// Widget fouthAppBar({
//   @required BuildContext context,
//   String title,
//   Widget leading,
//   List<Widget> actions,
// }) {
//   return AppBar(
//     backgroundColor: appBgFourth,
//     elevation: 0,
//     title: title != null
//         ? Center(
//             child: Text(
//               title,
//               style: TextStyle(fontSize: duSetFontSize(16)),
//             ),
//           )
//         : null,
//     centerTitle: true,
//     automaticallyImplyLeading: false,
//     leading: leading,
//     actions: actions,
//   );
// }
