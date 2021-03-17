import 'package:flutter/material.dart';

class BottomBarsItem {
  final Widget page;
  final Item item;

  BottomBarsItem({@required this.page, @required this.item});
}

class Item {
  final IconData icon;
  final Text title;
  final double iconSize;
  final Color color;
  final Color activeColor;

  Item({
    @required this.icon,
    @required this.title,
    this.iconSize,
    this.color,
    this.activeColor,
  }) {
    assert(icon != null);
    assert(title != null);
  }
}
