import 'package:chatapp/model/task.dart';
import 'package:chatapp/model/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskTitle extends StatelessWidget {
  TaskTitle(this.task);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            task.name,
            style: TextStyle(
                decoration: task.isDone ? TextDecoration.lineThrough : null),
          ),
          TaskCheckbox(task),
        ],
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  TaskCheckbox(this.task);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      value: task.isDone,
      onChanged: (value) {
        Provider.of<TaskData>(context, listen: false).toggleTask(task);
      },
    );
  }
}
