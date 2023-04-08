import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/features/task/data/models/task_model.dart';
import 'package:to_do_list_app/features/task/data/repository/task_data_repository.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';

/*
  TODO: 
  1. Это должен быть контроллер, через который проводятся все операции между
     вьюшкой и репозиторием. Название - TasksController.
  2. Этот контроллер должен обитать на presentation слое в папке controller.
  3. Он должен содержать все методы, к которым обращаются на вьюшке.
  
  !!! ВЬЮШКА НЕ ДОЛЖНА НАПРЯМУЮ ОБРАЩАТЬСЯ К РЕПОЗИТОРИЮ, ТОЛЬКО ЧЕРЕЗ КОНТРОЛЛЕР !!!
*/
class TasksListModel extends ChangeNotifier {
  /*
    TODO:
    1. По всему приложению мы должны работать с абстрактным классои - TaskRepository.
       Это необходимо для того, чтобы не зависеть от конкретной имплементации.
       ВЕЗДЕ РАБОТАЙ С АБСТРАКЦИЕЙ.
    2. Конкретную имплементацию передавай в main при создании контроллера. ТОЛЬКО ТАМ!
       Нельзя таким образом спавнить экземпляры репозиториев прямо здесь. 
       Их нужно создавать один раз и использовать только один экземпляр.
    3. Доступ к репозиторию может быть только в контроллере. В нашем случае это 
       контроллер на основе ChangeNotifier.
  */
  final TaskRepositoryImpl _repositoryImpl = TaskRepositoryImpl();
  List<TaskEntity> get tasks => _tasks;
  List<TaskEntity> _tasks = [];

  TasksListModel() {
    updateTasks();
  }

  Future<void> updateTasks() async {
    _tasks = await _repositoryImpl.getTasksList();
    notifyListeners();
    // TODO: зачем следующие 2 линии?
    final storage = Hive.box<TaskModel>('tasks');
    unawaited(storage.compact());
    unawaited(storage.close());
  }
}
