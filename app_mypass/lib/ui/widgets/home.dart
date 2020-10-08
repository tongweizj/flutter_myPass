import 'package:app_mypass/core/entitys/entitys.dart';
import 'package:app_mypass/ui/shared/shared.dart';
import 'package:flutter/material.dart';

Widget buildDivider() {
  return Container(
      width: duSetWidth(375),
      height: duSetHeight(20),
      margin: EdgeInsets.only(
        top: duSetHeight(0),
        bottom: duSetHeight(0),
        left: duSetWidth(14),
        right: duSetWidth(14),
      ),
      alignment: Alignment.centerLeft,
      child: Divider(height: 1));
}

Widget buildPassItem(
  BuildContext context,
  AppPasswordEntity item,
) {
  return Container(
      height: duSetHeight(40),
      width: duSetWidth(375),
      margin: EdgeInsets.only(
        top: duSetHeight(0),
        bottom: duSetHeight(0),
        left: duSetWidth(14),
        right: duSetWidth(14),
      ),
      padding: EdgeInsets.only(
          top: duSetHeight(0),
          left: duSetWidth(0),
          right: duSetWidth(0),
          bottom: duSetHeight(0)),
      // alignment: Alignment.centerLeft,
      color: appColorThird,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// 服务
            GestureDetector(
              onTap: () {
                print("Container was tapped");
                Navigator.pushNamed(context, "/pass", arguments: item);
              },
              child: Container(
                  margin: EdgeInsets.only(
                      top: duSetHeight(0), bottom: duSetHeight(0)),
                  width: duSetWidth(48),
                  height: duSetHeight(42),
                  // height: duSetHeight(67),

                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: appBgThird,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      )),
                  child: Text(
                    item.passWebsite,
                    style: TextStyle(
                      color: appColorThird,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: duSetFontSize(14),
                      height: 1,
                    ),
                  )),
            ),

            /// 密码信息
            GestureDetector(
              onTap: () {
                print("Container was tapped");
                Navigator.pushNamed(context, "/pass", arguments: item);
              },
              child: Container(
                  margin: EdgeInsets.only(
                      top: duSetHeight(0), bottom: duSetHeight(0)),
                  width: duSetWidth(250),
                  height: duSetHeight(40),
                  color: appColorThird,
                  alignment: Alignment.centerLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.passUsername,
                          style: TextStyle(
                            color: appColorSecond,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                            fontSize: duSetFontSize(14),
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          item.passEmail,
                          style: TextStyle(
                            color: appTextSecond,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                            fontSize: duSetFontSize(12),
                            height: 1,
                          ),
                        )
                      ])),
            ),

            /// 复制快捷键
            GestureDetector(
                onTap: () {
                  print("Copy pass");
                },
                child: Container(
                    margin: EdgeInsets.only(
                        top: duSetHeight(0), bottom: duSetHeight(0)),
                    width: duSetWidth(15),
                    // height: duSetHeight(67),
                    // color: Colors.yellow,
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.content_copy,
                      size: 16,
                      color: appColorFirst,
                    )))
          ]));
}
