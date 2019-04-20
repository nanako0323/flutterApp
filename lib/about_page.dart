import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {

  final String title;

  AboutPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: SafeArea(
        child: Text(this.title)
      )
    );
  }
}