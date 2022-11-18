import 'package:chatapp/model/task.dart';
import 'package:flutter/cupertino.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task('buy milk', false),
    Task('buy chocolate', true),
    Task('buy abc', false),
  ];

  void addTask(Task taskInput) {
    tasks.add(taskInput);
    notifyListeners();
  }

  void toggleTask(Task taskInput) {
    var index = tasks.indexOf(taskInput);
    print(index);

    taskInput.isDone = !taskInput.isDone;
    tasks.replaceRange(index, index + 1, [taskInput]);
  }
}
