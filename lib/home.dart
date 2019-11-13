import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './tool/navigationButton.dart';
import './tool/fancyFab.dart';

class HomePage extends StatefulWidget {
  final title;
  HomePage({Key key, this.title}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //keys     https://www.youtube.com/watch?v=kn0EOS-ZiIc
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        // floatingActionButtonAnimator: _FloatingButtonAnimator(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FancyFab(),
        body: Container(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightBlue,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NavigationButton(
                  type: 1,
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.width / 5),
              NavigationButton(
                  type: 2,
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.width / 5),
              NavigationButton(
                  type: 3,
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.width / 5),
              NavigationButton(
                  type: 4,
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.width / 5),
              SizedBox(width: MediaQuery.of(context).size.width / 5),
            ],
          ),
        ));
  }
}

// AnimationToolkit.dart
class AnimationToolkit {
  // ...
  static const FloatingActionButtonAnimator floatingButtonAnimator =
      _FloatingButtonAnimator();
}

class _FloatingButtonAnimator extends FloatingActionButtonAnimator {
  const _FloatingButtonAnimator();

  @override
  Animation<double> getScaleAnimation({Animation<double> parent}) {
    return parent.drive(Tween<double>(begin: 1, end: 1.0));
  }

  @override
  Animation<double> getRotationAnimation({Animation<double> parent}) {
    return parent.drive(Tween<double>(begin: 0, end: 1.0));
  }

  @override
  Offset getOffset({Offset begin, Offset end, double progress}) {
    if (progress < 0.5) {
      return begin;
    } else {
      return end;
    }
  }
}

//article https://medium.com/@agungsurya/create-a-simple-animated-floatingactionbutton-in-flutter-2d24f37cfbcc
