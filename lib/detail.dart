import 'package:flutter/material.dart';
import 'package:td2_2223/viewmodels/TaskViewModel.dart';
import 'AddTask.dart';
import 'models/task.dart';

class Detail extends StatelessWidget {
  final Task task;

  const Detail({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${task.id} details'),
      ),
      body: Container(
        child: Center(
          child: Column(children: [
            Text('Id: ${task.id}'),
            Text('Title: ${task.title}'),
            Text('Description: ${task.description}'),
            Text('Difficulty : ${task.difficulty}'),
            Text('Hours : ${task.nbhours}'),
            Text('Task tags: ${task.tags.join(" ")}'),
          ]),
        ),
      ),
    );
  }
}
