import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme => ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: const MaterialStatePropertyAll(
              TextStyle(fontSize: 16),
            ),
            backgroundColor: MaterialStatePropertyAll(Colors.indigo[300]),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Colors.deepPurple,
          ),
          bodyMedium: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.indigo,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.red),
        primarySwatch: Colors.indigo,
        appBarTheme: AppBarTheme(
          elevation: 0,
          toolbarHeight: 65,
          centerTitle: true,
          backgroundColor: Colors.indigo[300],
          iconTheme: const IconThemeData(
            size: 30,
            color: Colors.black87,
          ),
          titleTextStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
