import 'dart:ui';
import 'package:flutter/material.dart';

class TabItemMetadata {
  final String name;
  final Color color;

  TabItemMetadata(this.name, this.color);

  static List<TabItemMetadata> list() {
    return [
      TabItemMetadata("A", Colors.red),
      TabItemMetadata("B", Colors.blue),
      TabItemMetadata("C", Colors.green),
      TabItemMetadata("D", Colors.black12)
    ];
  }
}
