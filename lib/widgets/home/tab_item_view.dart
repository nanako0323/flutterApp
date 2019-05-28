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
    var client = Provider.of<EchoClient>(context);

    return Scaffold(
      backgroundColor: widget.color,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                  stream: client.stream,
                  initialData: "",
                  builder: (_, snap) {
                    if (snap.hasData) {
                      return Text(snap.data);
                    } else {
                      return Text("Error");
                    }
                  }),
              Padding(
                padding: EdgeInsets.all(150),
                  child: Transform(
                    alignment: Alignment.topRight,
                    transform: Matrix4.skewY(0.3)..rotateZ(3.14 / 12.0),
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: const Color(0xFFE8581C),
                        child: Text(DateTime.now().toString())),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
