import 'package:bottom_bars/bottom_bars.dart';
import 'package:bottom_bars/controllers/bottom_bars_controller.dart';
import 'package:flutter/material.dart';

class AnimatedBigBar extends StatefulWidget {
  final BottomBarsController bbc;
  final List<BottomBarsItem> items;
  final Color backgroundBarColor;

  AnimatedBigBar({
    Key key,
    @required this.bbc,
    @required this.items,
    this.backgroundBarColor,
  }) : super(key: key);

  @override
  _AnimatedBigBarState createState() => _AnimatedBigBarState();
}

class _AnimatedBigBarState extends State<AnimatedBigBar> {
  @override
  Widget build(BuildContext context) {
    Color sIconColor =
        Theme.of(context).bottomNavigationBarTheme.selectedIconTheme?.color ??
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor ??
            Theme.of(context).primaryColor;
    Color unsIconColor =
        Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme?.color ??
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ??
            Theme.of(context).unselectedWidgetColor;
    Color sTextColor =
        Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle?.color ??
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ??
            Theme.of(context).primaryColor;
    Color unsTextColor = Theme.of(context)
            .bottomNavigationBarTheme
            .unselectedLabelStyle
            ?.color ??
        Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ??
        Theme.of(context).unselectedWidgetColor;

    return Container(
      color: widget.backgroundBarColor,
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 56,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.items.asMap().entries.map((entries) {
            final index = entries.key;
            final value = entries.value;

            return GestureDetector(
                onTap: () {
                  widget.bbc.changeCurrentIndex(index);
                  // setState(() {});
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: index == widget.bbc.currentIndex ? 100 : 60,
                  decoration: BoxDecoration(
                    color: index == widget.bbc.currentIndex
                        ? (value.item.activeColor ?? sIconColor)
                            .withOpacity(0.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  curve: Curves.easeInOutCirc,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        value.item.icon,
                        size: value.item.iconSize,
                        color: index == widget.bbc.currentIndex
                            ? value.item.activeColor ?? sIconColor
                            : value.item.color ?? unsIconColor,
                      ),
                      index == widget.bbc.currentIndex
                          ? Text(
                              value.item.title.data,
                              style: value.item.title.style?.copyWith(
                                    color: index == widget.bbc.currentIndex
                                        ? value.item.activeColor ?? sTextColor
                                        : value.item.color ?? unsTextColor,
                                  ) ??
                                  TextStyle(
                                    color: index == widget.bbc.currentIndex
                                        ? value.item.activeColor ?? sTextColor
                                        : value.item.color ?? unsTextColor,
                                  ),
                            )
                          : SizedBox()
                    ],
                  ),
                ));
          }).toList()),
    );
  }
}
