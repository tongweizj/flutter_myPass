import 'package:app_mypass/core/view_models/user_model.dart';
import 'package:app_mypass/ui/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: appBgFourth,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.power_settings_new,
            text: 'Logout',
            onTap: () {
              context.read<UserModel>().logout();
              Navigator.pushNamed(context, '/login');
            },
          ),
          SizedBox(height: duSetHeight(280)),
          ListTile(
            title: Text(
              'v1.0.1_build 2020/10/18',
              style: TextStyle(fontSize: 11, color: Colors.grey[300]),
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
          color: appBgFourth,
        ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("myPass",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem({
    IconData icon,
    String text,
    GestureTapCallback onTap,
  }) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: appBgFifth,
          ),
          Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400)))
        ],
      ),
      onTap: onTap,
    );
  }
}
