import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_helloworld/about_page.dart';
import 'package:flutter_helloworld/home_page.dart';

import 'animation1_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(title: 'Home'),
        '/about': (BuildContext context) => AboutPage(title: 'About'),
        '/animation1': (BuildContext context) => Animation1Page(title: 'Animation'),
      },
    );
  }
}
