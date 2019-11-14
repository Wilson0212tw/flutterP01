import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Page2 extends StatefulWidget {
  Page2({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final wordList =
      generateWordPairs().take(100).map((e) => e.asPascalCase).toList();
  final wordBoolList = List.generate(100, (i) => true);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView_Original(
              wordlist: wordList, wordBoollist: wordBoolList)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ListView_Original extends StatefulWidget {
  final List<String> wordlist;
  final List<bool> wordBoollist;

  ListView_Original({this.wordlist, this.wordBoollist});

  @override
  _ListView_OriginalState createState() => _ListView_OriginalState();
}

class _ListView_OriginalState extends State<ListView_Original> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 50.0, //强制高度为50.0
        itemBuilder: (BuildContext context, int index) {
          return LabeledCheckbox(
            label: widget.wordlist[index],
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: widget.wordBoollist[index],
            onChanged: (bool newValue) {
              setState(() {
                widget.wordBoollist[index] = newValue;
              });
            },
          );
        });
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
            Expanded(child: Text(label))
          ],
        ),
      ),
    );
  }
}
