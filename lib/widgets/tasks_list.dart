import 'package:flutter/material.dart';
import 'package:to_do_list_app/widgets/tasks_list_item.dart';
import 'banner_add_task.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemCount: 15,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Column(
            children: const [
              BannerAddTask(),
              TasksListItem(),
            ],
          );
        } else {
          return const TasksListItem();
        }
      },
      separatorBuilder: (BuildContext context, index) =>
          const SizedBox(height: 8.0),
    );
  }
}
