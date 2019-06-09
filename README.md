# BottomBars

A new Flutter package to facilitate the use of personalized bottom bars.

## Preview

## Example gif

## Getting Started
Add the plugin:
```yaml
dependencies:
  ...
  bottom_bars: ^0.0.1
```
## Example Usage
```dart
import 'package:flutter/material.dart';
import 'package:bottom_bars/bottom_bars.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomBars(
      floatingActionButton: [
        FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.backspace),
        ),
        null,
        null,
        FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.backspace),
        ),
      ],
      appBar: [
        AppBar(
          title: Text("AppBar"),
        )
      ],
      tabs: <Widget>[
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
      ],
      selectedIndex: _index,
      onItemSelected: (index) {
        setState(() {
          _index = index;
        });
      },
      items: [
        BottomBarsItem(
            icon: Icon(Icons.group),
            title: Text("Group"),
            color: Colors.blueAccent),
        BottomBarsItem(
            icon: Icon(Icons.apps),
            title: Text("Home"),
            color: Colors.blueAccent,
            isEnabled: true),
        BottomBarsItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
            color: Colors.blueAccent),
        BottomBarsItem(
            icon: Icon(Icons.apps),
            title: Text("Home"),
            color: Colors.blueAccent),
        BottomBarsItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
            color: Colors.blueAccent,
            isEnabled: true),
      ],
    );
  }
}
```

## Modifications

### BottomBars

+ **@required tabs** - Your pages that probably you'd use in PageView
+ **appBar** - Your appBar (it's a list because each tab has a appBar)
+ **floatingActionButton** - Yout floatingActionButton (same idea of appBar)
+ **backgroundColor** - bottomBar color
+ **@required** selectedIndex - Current index of item (set it 0)
+ **iconSize** - Icon's size
+ **colorItems** - Color of each item
+ **@required items** - Your items <BottomBarsItem>
+ **@required onItemSelected** - A function that happens when you tapped the button item

### BottomBarsItem

+ **@required icon** - Item's icon
+ **@required title** - Item's title
+ **color** - Item's color when is active
+ **isEnabled** - Gets enabled when it is enabled
