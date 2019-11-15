import 'package:flutter/material.dart';
import 'package:flutterp01/page2.dart';
import './home.dart';
import 'page1.dart';
import 'page3.dart';
import 'page4.dart';

// import 'dart:io';
// import 'package:flutter/foundation.dart';

// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
// void _enablePlatformOverrideForDesktop() {
//   if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
//     debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
//   }
// }

// void main() {
//   _enablePlatformOverrideForDesktop();
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

final ThemeData themeData = ThemeData(
    // canvasColor: Colors.lightGreenAccent,
    // accentColor: Colors.redAccent,
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
        title: TextStyle(
      // color: Colors.red,
      // fontSize: 24.0,
      // fontWeight: FontWeight.w900,
      // letterSpacing: 20.0,
    )));

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
