import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 350,
          height: 90,
          color: Colors.amber[100],
          child: Text(
            index % 2 == 0
                ? 'Task ${index + 1}. Отжумания'
                : 'Task ${index + 1}. Пресс качат',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 30);
      },
    );
  }
}
