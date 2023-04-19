import 'dart:async';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task/data/models/task_model.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';
import 'package:to_do_list_app/features/task/domain/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  @override
  Future<void> addTask(TaskEntity newTask) async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    await storage.put(newTask.id, newTask.toModel());
    await storage.close();
  }

  @override
  Future<List<TaskEntity>> getTasksList() async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    final tasksList = storage.values.map((task) => task.toEntity()).toList();
    await storage.close();

    return _sorting(tasksList);
  }

  @override
  Future<void> deleteTask(int id) async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    await storage.delete(id);
    await storage.close();
  }

  @override
  Future<void> toggleTaskStatus(int id) async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    final task = storage.get(id);
    if (task != null) {
      final updatedTask =
          task.copyWith(isDone: !task.isDone, updatedAt: DateTime.now());
      await storage.put(id, updatedTask);
    }
    await storage.close();
  }
}

List<TaskEntity> _sorting(List<TaskEntity> list) {
  // final reversedList = list.reversed;
  final listWithDate = list.where((task) => task.dueDate != null).toList()
    ..sort(_dateSort);

  final listWithoutDate = list.reversed
      .where((task) => task.dueDate == null)
      .toList()
    ..sort(_updatedSort);

  final sortedList = [
    ...listWithDate,
    ...listWithoutDate,
  ]..sort(_statusSort);

  return sortedList;
}

int _dateSort(TaskEntity a, TaskEntity b) {
  final dateA = a.dueDate;
  final dateB = b.dueDate;
  return dateA == null
      ? 1
      : dateB == null
          ? -1
          : dateA.compareTo(dateB);
}

int _statusSort(TaskEntity a, TaskEntity b) {
  return a.isDone == b.isDone ? 0 : (a.isDone ? 1 : -1);
}

int _updatedSort(TaskEntity a, TaskEntity b) {
  return b.updatedAt.compareTo(a.updatedAt);
}
