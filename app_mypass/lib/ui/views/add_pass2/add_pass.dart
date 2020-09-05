import 'package:flutter/material.dart';

class AddPassPage extends StatefulWidget {
  AddPassPage({Key key}) : super(key: key);

  @override
  _AddPassPageState createState() => _AddPassPageState();
}

class _AddPassPageState extends State<AddPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD PASS Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("ADD PASS Page", textDirection: TextDirection.ltr),
            Spacer(),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/home",
                );
              },
              child: Text(
                "保 存",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
