import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_helloworld/pages/about_page.dart';
import 'package:flutter_helloworld/pages/home_page.dart';
import 'package:flutter_helloworld/pages/animation1_page.dart';
import 'package:provider/provider.dart';
import 'models/echo_client.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<EchoClient>(
        builder: (_) {
          EchoClient echo = EchoClient();
          echo.connect();

          return echo;
        },
        dispose: (_, value) => value.dispose(),
        child: MaterialApp(
          title: 'Flutter',
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/': (BuildContext context) => HomePage(title: 'Home'),
            '/about': (BuildContext context) => AboutPage(title: 'About'),
            '/animation1': (BuildContext context) =>
                Animation1Page(title: 'Animation'),
          },
        ));
  }
}
