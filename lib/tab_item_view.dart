import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class TabItemView extends StatefulWidget {
  final Color color;

  final String title;

  final IOWebSocketChannel channel;

  TabItemView(this.title,this.color,this.channel);

  @override
  _TabItemViewState createState() => _TabItemViewState();
}

class _TabItemViewState extends State<TabItemView> {

  @override
  void dispose() {
    super.dispose();
  }

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
                stream: widget.channel.stream,
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