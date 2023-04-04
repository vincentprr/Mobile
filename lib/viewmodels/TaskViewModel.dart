import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:td2_2223/models/task.dart';

class TaskViewModel extends ChangeNotifier {
  late List<Task> liste;
  TaskViewModel() {
    liste = [];
  }

  void addTask(Task task) {
    liste.add(task);
    notifyListeners();
  }

  void delTask(Task task) {
    liste.remove(task);
    notifyListeners();
  }

  void editTask(Task task) {
    liste[task.id] = task;
    notifyListeners();
  }

  void generateTasks() {
    liste = Task.generateTask(50);
    notifyListeners();
  }

  Task getTaskById(int taskId) {
    return liste.firstWhere((element) => element.id == taskId);
  }
}
