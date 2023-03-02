import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          actions: const [
            Icon(
              Icons.calendar_month,
              color: Colors.black,
            )
          ],
          backgroundColor: Colors.white,
          title: const Text(
            'My Tasks',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: const HomePage(),
      ),
    );
  }
}
