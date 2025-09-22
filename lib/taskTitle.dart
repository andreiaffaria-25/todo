import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/task.dart';

class TaskTile extends StatefulWidget  {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  _TaskTileState createState() => _TaskTileState();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckboxListTile(
        title: Text("Checked"),
        secondary: Icon(Icons.beach_access_rounded),
        controlAffinity: 
        ListTileControlAffinity.platform,
        value: Task(title),
        onChanged: (bool value) {
          setState(() {
            Task(this.isDone) = value,
          }
          )
        },
      ),
    );
  }
  }

