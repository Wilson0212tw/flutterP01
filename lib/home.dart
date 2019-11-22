import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:english_words/english_words.dart';
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
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    // scrollController
    //   ..addListener(() {
    //     if (scrollController.offset > 0.0) {
    //       setState(() {});
    //     }
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        // floatingActionButtonAnimator: _FloatingButtonAnimator(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FancyFab(
          onPressed: () {
            scrollController.position.animateTo(0,
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn);
          },
        ),
        // body: ListView_Original(),
        // body: ListView_Separated(),
        body: InfiniteListView(scrollController: scrollController),
        bottomNavigationBar: CustomBottomBar());
  }
}

//article https://medium.com/@agungsurya/create-a-simple-animated-floatingactionbutton-in-flutter-2d24f37cfbcc

//
//
//
//
//
//
//
//
//
//
//

class ListView_Original extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 50.0, //强制高度为50.0
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        });
  }
}

//
//
//
//
//
//
//
//
//
//
//
//


class ListView_Separated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) =>
          ListTile(title: Text("$index")),
      separatorBuilder: (BuildContext context, int index) =>
          Divider(color: Colors.green),
    );
  }
}



//
//
//
//
//
//
//
//
//

class InfiniteListView extends StatefulWidget {
  final ScrollController scrollController;
  InfiniteListView({this.scrollController});
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  var _words = <String>[];

  @override
  void initState() {
    super.initState();
    _words.insertAll(
        0,
        //每次生成2100单词
        generateWordPairs().take(100).map((e) => e.asPascalCase).toList());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      controller: widget.scrollController,
      itemBuilder: (BuildContext context, int index) =>
          ListTile(title: Text("$index")),
      separatorBuilder: (BuildContext context, int index) =>
          Divider(color: Colors.green),
    );
  }
}


//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//


class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
              routerString: '/page3',
              type: 3,
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.width / 5),
          NavigationButton(
              routerString: '/page4',
              type: 4,
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.width / 5),
          SizedBox(width: MediaQuery.of(context).size.width / 5),
        ],
      ),
    );
  }
}
