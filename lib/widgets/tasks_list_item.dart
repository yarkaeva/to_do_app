import 'package:flutter/material.dart';
import 'package:to_do_list_app/data/data.dart';

class TasksListItem extends StatefulWidget {
  const TasksListItem({super.key, required this.index});
  final int index;
  @override
  State<TasksListItem> createState() => _TasksListItemState();
}

class _TasksListItemState extends State<TasksListItem> {
  late bool isDone;

  @override
  void initState() {
    super.initState();
    isDone = Data().data[widget.index].isDone;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      tileColor: isDone == false ? Colors.indigo[100] : Colors.green[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      activeColor: Colors.indigo[400],
      checkboxShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      value: isDone,
      onChanged: (bool? newStatus) {
        setState(() {
          isDone = newStatus!;
        });
      },
      title: Text(
        Data().data[widget.index].title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          decoration:
              isDone == true ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Data().data[widget.index].dueDate != null
          ? Text(
              'дедлайн:  ${Data().data[widget.index].dueDate} ',
            )
          : null,
    );
  }
}
