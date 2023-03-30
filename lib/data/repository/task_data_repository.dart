import 'package:hive/hive.dart';
import 'package:to_do_list_app/data/task_model.dart';
import 'package:to_do_list_app/domain/repository/task_repository.dart';

class TaskDataRepo extends TaskRepository {
  @override
  Future<void> addNewTask(TaskModel newTask) async {
    final box = await Hive.openBox<TaskModel>('tasks');
    await box.add(newTask);
  }
}
