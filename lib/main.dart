// import 'package:cocktail/homepage.dart';
import 'package:cocktail/homepage.dart';
import 'package:flutter/material.dart';

// const Color myColor = Colors.cyan;
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cocktail App',
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: Homepage(),
    );
  }
}
