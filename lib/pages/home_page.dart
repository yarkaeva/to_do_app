import 'package:flutter/material.dart';
import '../widgets/tasks_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_month_outlined),
            iconSize: 30,
            color: Colors.indigo[600],
            splashRadius: 20,
          )
        ],
        backgroundColor: Colors.white,
        title: const Text(
          'My Tasks',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: const TasksList(),
    );
  }
}
