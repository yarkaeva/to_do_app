import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/theme.dart';
import 'package:to_do_list_app/data/data.dart';
import 'package:to_do_list_app/pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(dataConstructor: Data()),
      },
    );
  }
}
