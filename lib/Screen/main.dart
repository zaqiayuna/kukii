import 'package:flutter/material.dart';
import 'package:kuki/Screen/App.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kuki',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const App(
          page: 'Home',
          index: 0,
        ));
  }
}
