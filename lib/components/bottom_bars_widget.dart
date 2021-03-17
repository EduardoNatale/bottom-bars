import 'package:bottom_bars/bottom_bars.dart';
import 'package:bottom_bars/components/animated_bar.dart';
import 'package:bottom_bars/components/animated_big_bar.dart';
import 'package:bottom_bars/controllers/bottom_bars_controller.dart';
import 'package:bottom_bars/components/pattern.dart';
import 'package:flutter/material.dart';

class BottomBars extends StatefulWidget {
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
  }) : super(key: key) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    assert(initialIndex >= 0 && initialIndex < items.length);
  }

  @override
  _BottomBarsState createState() => _BottomBarsState();
}

class _BottomBarsState extends State<BottomBars> {
  BottomBarsController bbc;

  @override
  void initState() {
    super.initState();
    bbc = BottomBarsController(
      initialIndex: widget.initialIndex,
      onTap: widget.onTap,
      canAnimate: widget.canAnimate,
      curves: widget.curves,
      duration: widget.duration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: bbc.pageController,
        onPageChanged: (index) {
          bbc.changeCurrentIndexByScroll(index);
          setState(() {});
        },
        physics: widget.canDrag ? null : NeverScrollableScrollPhysics(),
        children: widget.items.map<Widget>((item) => item.page).toList(),
      ),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBottomBar() {
    switch (widget.type) {
      case BottomBarsType.Pattern:
        return Pattern(
          bbc: bbc,
          items: widget.items,
          backgroundBarColor: widget.backgroundBarColor,
        );
        break;
      case BottomBarsType.Animated:
        return AnimatedBar(
          bbc: bbc,
          items: widget.items,
          backgroundBarColor: widget.backgroundBarColor,
        );
        break;
      case BottomBarsType.BigOne:
        return AnimatedBigBar(
          bbc: bbc,
          items: widget.items,
          backgroundBarColor: widget.backgroundBarColor,
        );
        break;
      default:
        return Pattern(
          bbc: bbc,
          items: widget.items,
          backgroundBarColor: widget.backgroundBarColor,
        );
    }
  }
}
