import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  final String title;

  AboutPage({Key key, this.title}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool _value1 = false;
  bool _value2 = false;

  @override
  Widget build(BuildContext context) {
    var switchList = List.from([
      Switch.adaptive(value: _value1, onChanged: _onSwitchChanged1),
      Switch.adaptive(value: _value2, onChanged: _onSwitchChanged2),
    ]);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[...switchList]))));
  }

  _onSwitchChanged1(newValue) {
    setState(() {
      _value1 = newValue;
    });
  }

  _onSwitchChanged2(newValue) {
    setState(() {
      _value2 = newValue;
    });
  }
}
