import 'package:flutter/material.dart';

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
            children: [
              Container(
                  color: widget.color,
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
