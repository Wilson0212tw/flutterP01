import 'package:flutter/material.dart';
import 'package:flutterp01/page2.dart';
import './home.dart';
import 'page1.dart';
import 'page3.dart';
import 'page4.dart';

void main() => runApp(MyApp());

final ThemeData themeData = ThemeData(
  // canvasColor: Colors.lightGreenAccent,
  // accentColor: Colors.redAccent,
  primarySwatch: Colors.blue,
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: HomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/home': (context) => HomePage(),
        '/page1': (context) => Page1(title: 'Page1'),
        '/page2': (context) => Page2(title: 'Page1'),
        '/page3': (context) => Page3(title: 'Page3'),
        '/page4': (context) => Page4(title: 'Page4'),
      },
    );
  }
}
