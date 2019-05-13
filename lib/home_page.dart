import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'tab_item_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  IOWebSocketChannel _channel =
      IOWebSocketChannel.connect('ws://echo.websocket.org');

  List<Widget> _children;

  @override
  void initState() {
    super.initState();

    _children = [
      TabItemView("A", Colors.red, _channel),
      TabItemView("B", Colors.blue, _channel)
    ];

    Timer timer = Timer.periodic(Duration(seconds: 1), (t) {
      _channel.sink.add(DateTime.now().toString());
    });
  }

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: <Widget>[]),
      drawer: Drawer(child: _drawerContents(context)),
      body: SafeArea(child: _children[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
        ],
      ),
    );
  }

  Widget _drawerContents(BuildContext context) {
    return ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
        child: Text('Menu'),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('Animation1'),
        onTap: () {
          Navigator.of(context).pushNamed('/animation1');
        },
      ),
      ListTile(
          title: Text('About'),
          onTap: () {
            Navigator.of(context).pushNamed('/about');
          }),
    ]);
  }

  _onTabTapped(int index) {
    this.changeIndex(index);
  }
}
