import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task/data/mappers/mapper.dart';
import 'package:to_do_list_app/features/task/data/models/task_model.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';
import 'package:to_do_list_app/features/task/domain/repository/task_repository.dart';

// TODO: Impl
class TaskDataRepo extends TaskRepository {
 // TODO: должен принимать Entity
  @override
  Future<void> addNewTask(TaskModel newTask) async {
    final box = await Hive.openBox<TaskModel>('tasks');
    await box.add(newTask);
  }

  // TODO:Future
  @override
  TaskEntity getTaskByIndex(int index) {
    final box = Hive.box<TaskModel>('tasks');
    //  TODO: null check
    final task = TaskMapper.fromTaskData(box.getAt(index)!);
    return task;
  }
}
