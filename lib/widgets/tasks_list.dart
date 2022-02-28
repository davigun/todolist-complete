import 'package:flutter/material.dart';
import 'package:todolist/widgets/task_tile.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  late final List<Task> tasks;
  TasksList(this.tasks);
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            isChecked: widget.tasks[index].isDone,
            taskTitle: widget.tasks[index].name,
            checkboxCallback: (bool? checkBoxState) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}
