library bottom_bars;

import 'package:flutter/material.dart';
import 'dart:core';

import 'package:flutter/widgets.dart';

class BottomBars extends StatefulWidget {
  final List<Widget> tabs;
  final int type;
  final List<PreferredSizeWidget> appBar;
  final List<Widget> floatingActionButton;
  final Color backgroundColor;
  final double iconSize;
  final Color colorItems;
  final List<BottomBarsItem> items;

  BottomBars({
    this.backgroundColor = Colors.white,
    @required this.tabs,
    this.type = 0,
    this.floatingActionButton,
    this.appBar,
    this.colorItems = Colors.black,
    this.iconSize = 24,
    @required this.items,
  }) {
    assert(items != null);
    assert((items.length >= 2 || items.length >= 5) &&
        items.length == tabs.length);
    assert(
        (tabs.length >= 2 || tabs.length >= 5) && items.length == tabs.length);
    assert(type >= 0 || type < 2);
  }

  @override
  _BottomBarsState createState() => _BottomBarsState();
}

class _BottomBarsState extends State<BottomBars> {
  final _pageController = PageController();
  int _lastIndex = 0;
  bool clicked = false;
  int selectedIndex = 0;

  Widget _buildItemTypeZero(BottomBarsItem item, bool isSelected) {
    return AnimatedContainer(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      width: isSelected ? 130 : 50,
      height: double.maxFinite,
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: isSelected ? item.color.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(right: 8),
                child: IconTheme(
                  data: IconThemeData(
                      size: widget.iconSize,
                      color: isSelected
                          ? item.color
                          : item.isEnabled ? Colors.grey : widget.colorItems),
                  child: item.icon,
                ),
              ),
              isSelected
                  ? DefaultTextStyle.merge(
                      style: TextStyle(
                          color: isSelected
                              ? item.color
                              : item.isEnabled
                                  ? Colors.grey
                                  : widget.colorItems),
                      child: item.title)
                  : Container()
            ],
          )
        ],
      ),
    );
  }

  int distance(x, y) {
    if ((x - y) < 0)
      return (x - y) * -1;
    else
      return (x - y);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _buildFloatingActionButton(selectedIndex),
        appBar: _buildAppBar(selectedIndex),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) async {
            if (widget.items[index].isEnabled == true &&
                distance(index, _lastIndex) <= 1 &&
                clicked == false) {
              await _pageController.animateToPage(_lastIndex,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
              selectedIndex = index;
            } else {
              setState(() {
                selectedIndex = index;
                _lastIndex = index;
              });
            }
          },
          children: widget.tabs,
        ),
        bottomNavigationBar: _buildBottom(widget.type));
  }

  Widget _buildBottom(int type) {
    switch (type) {
      case 0:
        return typeZero();
        break;
      case 1:
        return typeOne();
        break;
      default:
        return typeZero();
    }
  }

  Widget _buildItemTypeOne(BottomBarsItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: isSelected ? 100 : 60,
      decoration: BoxDecoration(
          color: isSelected ? item.color.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(100))),
      curve: Curves.easeInOutCirc,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconTheme(
            child: item.icon,
            data: IconThemeData(
                size: widget.iconSize,
                color: isSelected
                    ? item.color
                    : item.isEnabled ? Colors.grey : widget.colorItems),
          ),
          isSelected
              ? DefaultTextStyle.merge(
                  style: TextStyle(
                      color: isSelected
                          ? item.color
                          : item.isEnabled ? Colors.grey : widget.colorItems),
                  child: item.title)
              : Container()
        ],
      ),
    );
  }

  Widget typeOne() {
    return Container(
      color: widget.backgroundColor,
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      width: double.infinity,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.items.map((item) {
          int index = widget.items.indexOf(item);
          return GestureDetector(
            onTap: () async {
              clicked = true;
              _lastIndex = index;
              await _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
              clicked = false;
              setState(() {
                selectedIndex = index;
              });
            },
            child: _buildItemTypeOne(item, index == selectedIndex),
          );
        }).toList(),
      ),
    );
  }

  Widget typeZero() {
    return Container(
      color: widget.backgroundColor,
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      width: double.infinity,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widget.items.map((item) {
          int index = widget.items.indexOf(item);
          return GestureDetector(
            onTap: item.isEnabled
                ? null
                : () async {
                    clicked = true;
                    _lastIndex = index;
                    await _pageController.animateToPage(index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                    clicked = false;
                    setState(() {
                      selectedIndex = index;
                    });
                  },
            child: _buildItemTypeZero(item, index == selectedIndex),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFloatingActionButton(int index) {
    if (index != null) {
      try {
        return widget.floatingActionButton[index];
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  PreferredSizeWidget _buildAppBar(int index) {
    if (widget.appBar != null) {
      try {
        return widget.appBar[index];
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}

class BottomBarsItem {
  final Icon icon;
  final Color color;
  final Text title;
  final bool isEnabled;

  BottomBarsItem(
      {@required this.icon,
      @required this.title,
      this.color = Colors.blue,
      this.isEnabled = false}) {
    assert(icon != null);
    assert(title != null);
  }
}
