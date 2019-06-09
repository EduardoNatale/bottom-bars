library bottom_bars;

import 'package:flutter/material.dart';

class BottomBars extends StatefulWidget {
  final List<Widget> tabs;
  final List<PreferredSizeWidget> appBar;
  final List<Widget> floatingActionButton;
  final Color backgroundColor;
  int selectedIndex;
  final double iconSize;
  final Color colorItems;
  final List<BottomBarsItem> items;
  final ValueChanged<int> onItemSelected;

  BottomBars(
      {this.backgroundColor = Colors.white,
      @required this.tabs,
      this.floatingActionButton,
      this.appBar,
      this.colorItems = Colors.black,
      this.selectedIndex = 0,
      this.iconSize = 24,
      @required this.items,
      @required this.onItemSelected}) {
    assert(items != null);
    assert((items.length >= 2 || items.length >= 5) &&
        items.length == tabs.length);
    assert(onItemSelected != null);
    assert(
        (tabs.length >= 2 || tabs.length >= 5) && items.length == tabs.length);
  }

  @override
  _BottomBarsState createState() => _BottomBarsState();
}

class _BottomBarsState extends State<BottomBars> {
  final _pageController = PageController();
  int _lastIndex = 0;

  Widget _buildItem(BottomBarsItem item, bool isSelected) {
    print(widget.selectedIndex);
    return AnimatedContainer(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      width: isSelected ? 130 : 50,
      height: double.maxFinite,
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color:
            isSelected ? item.color.withOpacity(0.2) : widget.backgroundColor,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingActionButton(widget.selectedIndex),
      appBar: _buildAppBar(widget.selectedIndex),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          if (widget.items[index].isEnabled == true)
            _pageController.animateToPage(_lastIndex,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          else {
            widget.onItemSelected(index);
            _lastIndex = index;
            setState(() {
              widget.selectedIndex = index;
            });
          }
        },
        children: widget.tabs,
      ),
      bottomNavigationBar: Container(
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
                  : () {
                      widget.onItemSelected(index);
                      _lastIndex = index;
                      setState(() {
                        widget.selectedIndex = index;
                        _pageController.animateToPage(index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                      });
                    },
              child: _buildItem(item, index == widget.selectedIndex),
            );
          }).toList(),
        ),
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
