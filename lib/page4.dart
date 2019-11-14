import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// data table https://www.youtube.com/watch?v=ktTajqbhIcY&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=57

class Page4 extends StatefulWidget {
  Page4({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  void displayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text("Alert"),
        content: Text("My alert message"),
        actions: [
          CupertinoDialogAction(
              isDefaultAction: true,
              child: new Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book_solid), title: Text('Articles')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.eye_solid), title: Text('Views'))
        ],
      ),
      tabBuilder: (context, i) {
        return Center(
            child: RaisedButton.icon(
                icon: Icon(CupertinoIcons.gear_big),
                label: Text('press me'),
                onPressed: displayDialog));
      },
    );
  }
}
