import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationButton extends StatefulWidget {
  final height;
  final width;
  final type;
  final Map<int, AnimatedIconData> switchIconMap = {
    1: AnimatedIcons.list_view,
    2: AnimatedIcons.ellipsis_search,
    3: AnimatedIcons.event_add,
    4: AnimatedIcons.play_pause
  };

  NavigationButton({this.type = 1, this.height = 30, this.width = 30});

  @override
  _NavigationButtonState createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _animateColor;
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
    _animateColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        child: Container(
            // foregroundDecoration: BoxDecoration(
            //   color: _animateColor.value,
            //   border: Border.all(
            //       color: Colors.green, width: 5.0, style: BorderStyle.solid),
            //   shape: BoxShape.circle,
            // ),
            child: IconButton(
                onPressed: animate,
                icon: AnimatedIcon(
                  icon: widget.switchIconMap[widget.type],
                  progress: _animateIcon,
                ))));

    //  FloatingActionButton(
    //   backgroundColor: _animateColor.value,
    //   onPressed: animate,
    //   tooltip: 'Toggle',
    //   child: AnimatedIcon(
    //     icon: AnimatedIcons.menu_close,
    //     progress: _animateIcon,
    //   ),
    // );
  }
}
