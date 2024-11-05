import 'package:flutter/material.dart';
import 'package:stadtplan/presentation/home_screen/widgets/bottom_navigation/paint/half_clipper.dart';
import 'package:stadtplan/presentation/home_screen/widgets/bottom_navigation/paint/half_painter.dart';
import 'package:stadtplan/presentation/home_screen/widgets/home_screen.dart';
import 'package:stadtplan/themes/assets.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:stadtplan/themes/text_styles.dart';

const double circleSize = 60;
const double arcHeight = 70;
const double arcWidth = 90;
const double circleOutline = 10;
const double shadowAllowance = 20;
const double barHeight = 60;

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
    required this.items,
    required this.onItemSelected,
    this.selectedIndex = 0,
  });

  final void Function(int position) onItemSelected;
  final List<NavigationPageView> items;
  final int selectedIndex;

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation>
    with TickerProviderStateMixin, RouteAware {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: barHeight,
          decoration: BoxDecoration(
            color: Palette.appCardColor,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                offset: Offset(0, -2),
                color: Colors.black12,
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: widget.items.map((NavigationPageView item) {
              final int index = widget.items.indexOf(item);
              return Flexible(
                child: GestureDetector(
                  onTap: () => widget.onItemSelected(index),
                  child: _BottomNavigationItem(
                    item: item,
                    isSelected: index == widget.selectedIndex,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Positioned.fill(
          top: -(circleSize + circleOutline + shadowAllowance) / 2,
          child: GestureDetector(
            onTap: () {
              widget.onItemSelected(1);
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: FractionallySizedBox(
                widthFactor: 1 / 5,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRect(
                      clipper: HalfClipper(),
                      child: Center(
                        child: Container(
                          width: circleSize + circleOutline,
                          height: circleSize + circleOutline,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: arcHeight,
                      width: arcWidth,
                      child: CustomPaint(
                        painter: HalfPainter(Palette.appCardColor),
                      ),
                    ),
                    SizedBox(
                      height: 110,
                      width: 110,
                      child: widget.selectedIndex == 1
                          ? ImageAssets.icNavChargeSelected()
                          : ImageAssets.icNavCharge(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  const _BottomNavigationItem({required this.item, required this.isSelected});

  final NavigationPageView item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(color: Palette.appCardColor),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 29,
              width: 1,
              decoration: BoxDecoration(color: Palette.grey20),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: Spacings.small),
            child: Column(
              children: <Widget>[
                if (isSelected) item.activeIcon else item.icon,
                Text(
                  item.name,
                  style: isSelected
                      ? TextStyles.bottomMenuText()
                      : TextStyles.bottomMenuText(textColor: Palette.grey50),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
