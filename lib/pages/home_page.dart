import 'package:flutter/material.dart';
import 'package:flutter_helloworld/models/tab_item_metadata.dart';
import 'package:flutter_helloworld/widgets/home/tab_item_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _children;

  @override
  void initState() {
    super.initState();

    _children = TabItemMetadata.getMetadataList()
        .map((m) => TabItemView(m.name, m.color) as Widget);
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
          onTap: () => _onTap(context, '/animation1')),
      ListTile(title: Text('About'), onTap: () => _onTap(context, '/about'))
    ]);
  }

  _onTap(BuildContext context, String name) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed(name);
  }

  _onTabTapped(int index) {
    this.changeIndex(index);
  }
}
