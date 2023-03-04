import 'package:flutter/material.dart';
import 'package:to_do_list_app/data.dart';

class TasksListItem extends StatelessWidget {
  TasksListItem({super.key});
  final Data randomItem = Data();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.indigo[200],
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Text(
            randomItem.getRandomElement(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
