import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Page3 extends StatefulWidget {
  Page3({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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
