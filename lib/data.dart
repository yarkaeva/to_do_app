import 'dart:math';
import 'package:to_do_list_app/task_model.dart';

class Data {
  List<TaskModel> data = [
    TaskModel(
      title: 'Генеральная уборка',
      dueDate: DateTime(2023, 3, 7, 17, 30),
    ),
    TaskModel(
      title: 'Мастер-класс по танцам',
      dueDate: DateTime(2023, 3, 12, 9, 30),
    ),
    TaskModel(
      title: 'Составить отчет по практике',
      dueDate: DateTime(2023, 3, 13, 12, 30),
    ),
    TaskModel(
      title: 'Поход к стоматологу',
      dueDate: DateTime(2023, 4, 24, 19, 30),
    ),
  ];
  // int get activeTaskStatus => data.length;

  TaskModel getRandomTask() {
    final randomIndex = Random().nextInt(data.length);
    return data[randomIndex];
  }
}
