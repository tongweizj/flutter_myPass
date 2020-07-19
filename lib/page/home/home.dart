import 'package:app_mypass/common/utils/utils.dart';
import 'package:app_mypass/common/values/values.dart';
import 'package:app_mypass/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 顶部导航
  Widget _buildAppBar() {
    return secondAppBar(
        context: context,
        title: Text(
          "主页",
          style: TextStyle(
            color: appTextThird,
            fontFamily: 'Montserrat',
            fontSize: duSetFontSize(14.0),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.notifications_none,
            color: appiconSecond,
          ),
          iconSize: 28,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: appiconFirst,
            ),
            iconSize: 28,
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/add_pass",
              );
            },
          )
        ]);
  }

  Widget _buildPassItem(
    BuildContext context,
    Map item,
  ) {
    return Container(
        height: duSetHeight(33),
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
                  Navigator.pushNamed(
                    context,
                    "/pass",
                  );
                },
                child: Container(
                    margin: EdgeInsets.only(
                        top: duSetHeight(0), bottom: duSetHeight(0)),
                    width: duSetWidth(48),
                    height: duSetHeight(33),
                    // height: duSetHeight(67),

                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: appBgThird,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        )),
                    child: Text(
                      item["service"],
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
                  Navigator.pushNamed(
                    context,
                    "/pass",
                  );
                },
                child: Container(
                    margin: EdgeInsets.only(
                        top: duSetHeight(0), bottom: duSetHeight(0)),
                    width: duSetWidth(250),
                    height: duSetHeight(33),
                    color: appColorThird,
                    alignment: Alignment.centerLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item["name"],
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
                            item["email"],
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

  Widget _buildDivider() {
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

  @override
  Widget build(BuildContext context) {
    List _passList = [
      {
        "service": "icloud",
        "name": "tongweizj",
        "email": "tongweizj@gmail.com",
      },
      {
        "service": "icloud",
        "name": "tongweizj",
        "email": "tongweizj@gmail.com",
      }, 
    ];
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: _passList.map((pass) {
            return Column(
              children: <Widget>[
                SizedBox(height: 10),
                _buildPassItem(context, pass),
                _buildDivider()
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
