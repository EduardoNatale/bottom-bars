# Example

```dart
import 'package:flutter/material.dart';
import 'package:bottom_bars/bottom_bars.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return BottomBars(
      type: 0,
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
