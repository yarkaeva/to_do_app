import 'package:flutter/material.dart';

class HeadlineTexts extends StatelessWidget {
  const HeadlineTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'In progress(3)',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Add Task',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.lime[900],
            ),
          ),
        ],
      ),
    );
  }
}
