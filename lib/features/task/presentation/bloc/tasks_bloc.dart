import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';
import 'package:to_do_list_app/features/task/domain/repository/task_repository.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TaskRepository _repository;

  TasksBloc({required TaskRepository repository})
      : _repository = repository,
        super(TasksLoading()) {
    on<FirstLoad>(_onFirstLoad);
    on<TaskAdded>(_onTaskAdded);
    on<TaskToggled>(_onTaskToggled);
    on<TaskDeleted>(_onTaskDeleted);
  }

  Future<void> _onFirstLoad(
    FirstLoad event,
    Emitter<TasksState> emit,
  ) async {
    emit(TasksLoading());
    final tasks = await _repository.getTasksList();
    emit(TasksLoaded(tasks));
  }

  Future<void> _onTaskAdded(
    TaskAdded event,
    Emitter<TasksState> emit,
  ) async {
    await _repository.addTask(event.task);

    final tasks = await _repository.getTasksList();

    emit(TasksLoaded(tasks));
  }

  Future<void> _onTaskToggled(
    TaskToggled event,
    Emitter<TasksState> emit,
  ) async {
    await _repository.toggleTaskStatus(event.id);

    final tasks = await _repository.getTasksList();

    emit(TasksLoaded(tasks));
  }

  Future<void> _onTaskDeleted(
    TaskDeleted event,
    Emitter<TasksState> emit,
  ) async {
    await _repository.deleteTask(event.task.id);
    final tasks = await _repository.getTasksList();

    emit(TasksLoaded(tasks));
  }
}
