import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: const [
        Icons.home,
        Icons.search,
        Icons.favorite,
        Icons.person,
      ],
      activeIndex: currentIndex,
      gapLocation: GapLocation.center,
      onTap: onTap,
    );
  }
}
