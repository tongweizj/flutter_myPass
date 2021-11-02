import 'package:flutter/material.dart';
import 'package:mobile_time_bang/core/model/todo.dart';

class TodoDetail extends StatefulWidget {
  const TodoDetail(
      {Key? key,
      required this.onSave,
      required this.todo,
      required this.onDelete})
      : super(key: key);

  final Function onSave;
  final Todo todo;
  final Function onDelete;
  @override
  _TodoDetailState createState() => _TodoDetailState();
}

class _TodoDetailState extends State<TodoDetail> {
  final itemController = TextEditingController();
  @override
  void initState() {
    super.initState();
    itemController.text = widget.todo.name;
  }

  @override
  void dispose() {
    itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add a todo'),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                widget.onSave(itemController.text, widget.todo);
              },
              child: Text('儲存'))
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: TextField(
            controller: itemController,
            obscureText: false,
            decoration:
                InputDecoration(labelText: 'label', hintText: '請輸入項目名稱'),
          ),
        ),
      ),
    );
  }
}
