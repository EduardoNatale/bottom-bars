import 'package:flutter/material.dart';

class BottomBarsController {
  final int initialIndex;
  final Function(int) onTap;
  final bool canAnimate;

  final Curve curves;
  final Duration duration;

  PageController pageController;

  BottomBarsController({
    @required this.initialIndex,
    this.onTap,
    this.canAnimate,
    this.curves,
    this.duration,
  }) {
    pageController = PageController(initialPage: initialIndex);
    currentIndex = initialIndex;
  }

  int currentIndex;

  Future<void> changeCurrentIndex(int index) async {
    currentIndex = index;

    if (canAnimate)
      pageController.animateToPage(
        index,
        curve: curves,
        duration: duration,
      );
    else
      pageController.jumpToPage(index);
  }

  void changeCurrentIndexByScroll(int index) {
    if (onTap != null) onTap(index);
  }
}
