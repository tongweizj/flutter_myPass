import 'package:mypass/core/view_models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mypass/ui/style/style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: StyleColors.appBgFourth,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.power_settings_new,
            text: 'Logout',
            onTap: () {
              context.read<UserModel>().logout();
              Navigator.pushNamed(context, '/launch');
            },
          ),
          SizedBox(height: 280.h),
          ListTile(
            title: Text(
              'v1.0.3_build 2021/06/21',
              style: TextStyle(fontSize: 11.sp, color: Colors.grey[300]),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: StyleColors.appBgFourth,
        ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("myPass",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem({
    IconData? icon,
    String? text,
    GestureTapCallback? onTap,
  }) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: StyleColors.appBgFifth,
          ),
          Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(text!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w400)))
        ],
      ),
      onTap: onTap,
    );
  }
}
