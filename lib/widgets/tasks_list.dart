import 'package:chatapp/model/task_data.dart';
import 'package:chatapp/widgets/task_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<TaskData>(context).tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return TaskTitle(Provider.of<TaskData>(context).tasks[index]);
      },
      padding: EdgeInsets.all(8),
    );
  }
}
