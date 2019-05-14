import 'dart:ui';
import 'package:flutter/material.dart';

class TabItemMetadata {
  final String name;
  final Color color;

  TabItemMetadata(this.name, this.color);

  static List<TabItemMetadata> getMetadataList() {
    return [
      TabItemMetadata("A", Colors.red),
      TabItemMetadata("B", Colors.blue)
    ];
  }
}
