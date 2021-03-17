import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bottom_bars/bottom_bars.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BottomBars",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   selectedIconTheme: IconThemeData(color: Colors.yellow),
        //   selectedItemColor: Colors.purple,
        //   unselectedItemColor: Colors.pink,
        // ),
      ),
      // darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.dark,
      home: TabsPage(),
    );
  }
}

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return BottomBars(
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
    );
  }
}
