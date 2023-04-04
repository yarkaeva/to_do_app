import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task/data/models/task_model.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';
import 'package:to_do_list_app/features/task/domain/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  @override
  Future<void> addTask(TaskEntity newTask) async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    await storage.add(newTask.toModel());
  }

  @override
  Future<List<TaskEntity>> getTasksList() async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    final tasksList = storage.values.map((task) => task.toEntity()).toList();
    return tasksList;
  }
}
