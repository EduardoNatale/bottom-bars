import 'package:bottom_bars/bottom_bars.dart';
import 'package:bottom_bars/controllers/bottom_bars_controller.dart';
import 'package:flutter/material.dart';

class Pattern extends StatefulWidget {
  final BottomBarsController bbc;
  final List<BottomBarsItem> items;
  final Color backgroundBarColor;

  Pattern({
    Key key,
    @required this.bbc,
    @required this.items,
    this.backgroundBarColor,
  }) : super(key: key);

  @override
  _PatternState createState() => _PatternState();
}

class _PatternState extends State<Pattern> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        widget.bbc.changeCurrentIndex(index);
        // setState(() {});
      },
      currentIndex: widget.bbc.currentIndex,
      backgroundColor: widget.backgroundBarColor,
      type: BottomNavigationBarType.fixed,
      items: widget.items.asMap().entries.map<BottomNavigationBarItem>((entry) {
        final index = entry.key;
        final value = entry.value;

        return BottomNavigationBarItem(
          icon: Icon(
            value.item.icon,
            color: index == widget.bbc.currentIndex
                ? value.item.activeColor
                : value.item.color,
            size: value.item.iconSize,
          ),
          label: value.item.title.data,
        );
      }).toList(),
    );
  }
}
