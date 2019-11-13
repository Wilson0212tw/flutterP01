import 'package:flutter/material.dart';

class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Curve _curve = Curves.easeOut;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  // Widget add() {
  //   return new Container(
  //     child: FloatingActionButton(
  //       onPressed: null,
  //       tooltip: 'Add',
  //       child: Icon(Icons.add),
  //     ),
  //   );
  // }

  // Widget image() {
  //   return new Container(
  //     child: FloatingActionButton(
  //       onPressed: null,
  //       tooltip: 'Image',
  //       child: Icon(Icons.image),
  //     ),
  //   );
  // }

  // Widget inbox() {
  //   return new Container(
  //     child: FloatingActionButton(
  //       onPressed: null,
  //       tooltip: 'Inbox',
  //       child: Icon(Icons.inbox),
  //     ),
  //   );
  // }

  // Widget toggle() {
  //   return new Container(
  //     child: FloatingActionButton(
  //       backgroundColor: _buttonColor.value,
  //       onPressed: animate,
  //       tooltip: 'Toggle',
  //       child: AnimatedIcon(
  //         icon: AnimatedIcons.menu_close,
  //         progress: _animateIcon,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }
}
