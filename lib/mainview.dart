import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td2_2223/form/MyCustomFormModification.dart';
import 'package:td2_2223/models/task.dart';
import 'package:td2_2223/detail.dart';
import 'package:td2_2223/viewmodels/taskviewmodel.dart';

class Ecran1 extends StatelessWidget {
  late List<Task> tasks = Task.generateTask(50);
  String tags = '';
  @override
  Widget build(BuildContext context) {
    tasks = context.watch<TaskViewModel>().liste;
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                  child: Text(tasks[index].id.toString()),
                ),
                title: Text(tasks[index].title),
                subtitle: Text(tasks[index].tags.join(" ")),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detail(task: tasks[index])));
                },
              ),
            ));
  }
}
