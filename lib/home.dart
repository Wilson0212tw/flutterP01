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
        appBar: AppBar(
          title: Text(widget.title),
        ),
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
                  routerString: '/page1',
                  type: 1,
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.width / 5),
              NavigationButton(
                  routerString: '/page2',
                  type: 2,
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.width / 5),
              NavigationButton(
                  routerString: '/page1',
                  type: 3,
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.width / 5),
              NavigationButton(
                  routerString: '/page1',
                  type: 4,
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.width / 5),
              SizedBox(width: MediaQuery.of(context).size.width / 5),
            ],
          ),
        ));
  }
}

//article https://medium.com/@agungsurya/create-a-simple-animated-floatingactionbutton-in-flutter-2d24f37cfbcc
