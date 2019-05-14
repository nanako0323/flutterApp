import 'package:flutter/material.dart';
import 'package:flutter_helloworld/models/echo_client.dart';
import 'package:provider/provider.dart';

class TabItemView extends StatefulWidget {
  final Color color;
  final String title;

  TabItemView(this.title, this.color);

  @override
  _TabItemViewState createState() => _TabItemViewState();
}

class _TabItemViewState extends State<TabItemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder(
                  stream: Provider.of<EchoClient>(context).stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
