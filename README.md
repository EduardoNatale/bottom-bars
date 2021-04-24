# BottomBars

[![Pub](https://img.shields.io/pub/v/bottom_bars.svg)](https://pub.dev/packages/bottom_bars)

An easier way to create bottom bars in Flutter.

## Preview

<div>
  <img src="https://media.giphy.com/media/2Y8qyXCJS5EkwRR5kS/giphy.gif">
  <img src="https://media.giphy.com/media/2eKoICndjOZ15PTA17/giphy.gif">
</div>

## Import

```dart
import 'package:bottom_bars/bottom_bars.dart';
```

## Example

```dart
BottomBars(
  items: [
    BottomBarsItem(
      page: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
      item: Item(
        icon: Icons.group,
        title: Text("Group"),
      ),
    ),
    BottomBarsItem(
      page: Scaffold(
        appBar: AppBar(
          title: Text("Audio"),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
      item: Item(
        icon: Icons.ac_unit_outlined,
        title: Text("Audio"),
      ),
    ),
    BottomBarsItem(
      page: Scaffold(backgroundColor: Colors.yellow),
      item: Item(
        icon: Icons.home,
        title: Text("Home"),
        color: Colors.grey,
        activeColor: Colors.yellow,
      ),
    ),
    BottomBarsItem(
      page: Scaffold(backgroundColor: Colors.red),
      item: Item(
        icon: Icons.settings,
        title: Text("Settings"),
        color: Colors.grey,
        activeColor: Colors.red,
      ),
    ),
  ],
)
```

## Properties

```dart
final List<BottomBarsItem> items;
final BottomBarsType type;
final bool canDrag;
final int initialIndex;
final Function(int) onTap;
final Color backgroundBarColor;
final bool canAnimate;

final Curve curves;
final Duration duration;

BottomBars({
  Key key,
  @required this.items,
  this.type = BottomBarsType.Pattern,
  this.canDrag = false,
  this.initialIndex = 0,
  this.onTap,
  this.canAnimate = false,
  this.backgroundBarColor,
  this.curves = Curves.ease,
  this.duration = const Duration(milliseconds: 300),
})
```
