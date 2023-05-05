part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {
  @override
  List<Object> get props => [];

  const TasksState();
}

class InitialState extends TasksState {}

class TasksLoading extends TasksState {}

class TasksLoaded extends TasksState {
  final List<TaskEntity> tasks;

  @override
  List<Object> get props => [tasks];

  const TasksLoaded(this.tasks);
}

class TasksNotLoaded extends TasksState {}
