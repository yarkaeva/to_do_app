part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  @override
  List<Object> get props => [];
  const TasksEvent();
}

class FirstLoad extends TasksEvent {}

class TaskAdded extends TasksEvent {
  final TaskEntity task;
  const TaskAdded(this.task);
}

class TaskToggled extends TasksEvent {
  final int id;
  const TaskToggled(this.id);
}

class TaskDeleted extends TasksEvent {
  final TaskEntity task;
  const TaskDeleted(this.task);
}
