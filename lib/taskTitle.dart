import 'package:flutter/material.dart';
import 'package:todo_app/task.dart';

class TaskTile extends StatefulWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  State<TaskTile> createState() => TaskTileState();
}

class TaskTileState extends State<TaskTile> {
  @override
  
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.task.title),
      controlAffinity: ListTileControlAffinity.platform,
      value: widget.task.isDone,
      onChanged: (bool? value) {
        setState(() {
          widget.task.isDone = value ?? false;
        });
      },
      activeColor: const Color.fromARGB(255, 192, 76, 115),
      checkColor: Colors.white,
    );
  }
}
