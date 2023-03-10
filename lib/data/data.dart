import 'package:to_do_list_app/data/task_model.dart';

class Data {
  List<TaskModel> get data => List.generate(
        3,
        (index) => TaskModel(
            id: index,
            title: 'Генеральная уборка',
            dueDate: DateTime(2023, 3, 13, 12, 30)),
      );

  int get activeTaskCount => data.where((element) => !element.isDone).length;
}
