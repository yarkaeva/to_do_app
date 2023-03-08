import 'package:flutter/material.dart';

class BannerAddTask extends StatelessWidget {
  const BannerAddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'В процессе()',
          style: TextStyle(
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
    );
  }
}
