
// @dart=2.9
import 'package:demo/start.dart';
import 'package:flutter/material.dart';


import 'Home/Color/constants.dart';

void main() {
  runApp(new MyApp());
}

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext contet) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        primarySwatch: Colors.blue,
        fontFamily: "Gordita",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      home: const MyApp(),
    );
  }
}