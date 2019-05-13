import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class Animation1Page extends StatefulWidget {
  final String title;

  Animation1Page({Key key, this.title}) : super(key: key);

  @override
  Animation1PageState createState() => Animation1PageState();
}

class Animation1PageState extends State<Animation1Page>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 300).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: _animation.value,
      width: _animation.value,
      child: FlutterLogo(),
    )));
  }
}
