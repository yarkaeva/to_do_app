import 'package:flutter/material.dart';
import 'widgets/add_task_widget.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          // modalElevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(buttonColor: Colors.red[200]),
        primarySwatch: Colors.indigo,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            size: 30,
            color: Colors.indigo[600],
          ),
          titleTextStyle: TextStyle(
            color: Colors.indigo[900],
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/add_task': (context) => const AddTask(),
      },
    );
  }
}
