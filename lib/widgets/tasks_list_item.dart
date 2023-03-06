import 'package:flutter/material.dart';
import 'package:to_do_list_app/data.dart';
import 'package:to_do_list_app/task_model.dart';

class TasksListItem extends StatefulWidget {
  const TasksListItem({super.key});

  @override
  State<TasksListItem> createState() => _TasksListItemState();
}

class _TasksListItemState extends State<TasksListItem> {
  final TaskModel randomTaskFromList = Data().getRandomTask();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: randomTaskFromList.isDone == false
            ? Colors.indigo[100]
            : Colors.green[300],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: CheckboxListTile(
        activeColor: Colors.indigo[400],
        checkboxShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        value: randomTaskFromList.isDone,
        onChanged: (bool? newStatus) {
          setState(() {
            randomTaskFromList.isDone = newStatus!;
          });
        },
        title: Text(
          randomTaskFromList.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: randomTaskFromList.isDone == true
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: Text(
          'дедлайн: ${randomTaskFromList.dueDate} ',
        ),
      ),
    );
  }
}
