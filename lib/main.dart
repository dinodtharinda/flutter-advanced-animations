import 'package:flutter/material.dart';

import 'page/home_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.blue,
      appBarTheme: const AppBarTheme(
        color: Colors.blue,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
      ),
    ),
    home: const HomePage(),
  ));
}

