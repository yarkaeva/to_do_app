import 'package:flutter/material.dart';
import 'package:to_do_list_app/data.dart';

class BannerAddTask extends StatelessWidget {
  const BannerAddTask({
    super.key,
  });

  get activeTaskStatus => Data().data.length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'В процессе($activeTaskStatus)',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.purple[900]),
              overlayColor: MaterialStatePropertyAll(Colors.indigo[100]),
            ),
            child: Row(
              children: const [
                Icon(Icons.add_circle),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Добавить',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
