import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/features/task/presentation/bloc/tasks_bloc.dart';
import 'package:to_do_list_app/features/task/presentation/widgets/add_task_widget.dart';
import 'package:to_do_list_app/features/task/presentation/widgets/tasks_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<Widget>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const AddTask();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _showModalBottomSheet(context);
            },
            icon: const Icon(Icons.add),
            splashRadius: 20,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        title: const Text(
          'MY TASKS',
        ),
      ),
      body: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          if (state is TasksLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is TasksLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              itemCount: state.tasks.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      TasksListItem(task: state.tasks[index]),
                    ],
                  );
                } else {
                  return TasksListItem(task: state.tasks[index]);
                }
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8.0),
            );
          } else {
            return const Center(child: Text('Can`t download tasks'));
          }
        },
      ),
    );
  }
}
