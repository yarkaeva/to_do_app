import 'package:flutter/material.dart';

class ChallengeAdd extends StatelessWidget {
  const ChallengeAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          width: double.infinity,
          height: 170,
          color: Colors.white,
        ),
        Positioned(
          right: 35,
          child: Container(
            width: 340,
            height: 150,
            color: Colors.amber[800],
          ),
        ),
        Positioned(
          top: 20,
          right: 46,
          child: Container(
            width: 340,
            height: 150,
            color: Colors.amber,
          ),
        ),
        const Positioned(
          top: 35,
          right: 20,
          width: 330,
          child: Text(
            'Let`s Set-Up Your Live Now!',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 15,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.yellow[100],
            width: 150,
            child: const Text(
              'Add new Challenge',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
