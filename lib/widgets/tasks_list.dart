import 'package:flutter/material.dart';
import 'package:to_do_list_app/data/data.dart';
import 'package:to_do_list_app/widgets/tasks_list_item.dart';
// import 'banner_add_task.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemCount: Data().data.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Column(
            children: [
              // const BannerAddTask(),
              const SizedBox(height: 15),
              TasksListItem(index: index),
            ],
          );
        } else {
          return TasksListItem(index: index);
        }
      },
      separatorBuilder: (BuildContext context, index) =>
          const SizedBox(height: 8.0),
    );
  }
}
