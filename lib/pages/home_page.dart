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
  List<Widget> _tabViews;
  List<Tab> _tabs;

  _HomePageState() {
    _tabViews = TabItemMetadata.list()
        .map((m) => TabItemView(m.name, m.color) as Widget)
        .toList();

    _tabs = TabItemMetadata.list().map((m) {
      return Tab(text: m.name);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
  }

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: TabItemMetadata.list().length,
        child: Scaffold(
          appBar:
              AppBar(title: Text(widget.title), bottom: _buildTabBar(context)),
          drawer: Drawer(child: _buildDrawerContents(context)),
          body: TabBarView(
            children: _tabViews,
          ),
        ));
  }

  Widget _buildTabBar(BuildContext context) {
    return TabBar(tabs: _tabs);
  }

  Widget _buildDrawerContents(BuildContext context) {
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
}
