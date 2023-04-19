import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list_app/core/theme.dart';
import 'package:to_do_list_app/features/task/data/models/task_model.dart';
import 'package:to_do_list_app/features/task/data/repository/task_data_repository.dart';
import 'package:to_do_list_app/features/task/presentation/bloc/tasks_bloc.dart';
import 'package:to_do_list_app/features/task/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveInit();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TasksBloc>(
      create: (context) =>
          TasksBloc(repository: TaskRepositoryImpl())..add(FirstLoad()),
      child: MaterialApp(
        theme: CustomTheme.lightTheme,
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
        },
      ),
    );
  }
}

Future<void> hiveInit() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
}
