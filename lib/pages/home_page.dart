import 'package:flutter/material.dart';
import '../widgets/challange_ad.dart';
import '../widgets/headline_texts.dart';
import '../widgets/tasks_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      HeadlineTexts(),
      SizedBox(height: 40),
      ChallengeAdd(),
      SizedBox(height: 40),
      Expanded(child: TasksList()),
    ]);
  }
}
