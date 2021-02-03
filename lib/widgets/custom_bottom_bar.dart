import 'package:flutter/material.dart';
import 'package:otakoyi/core/app_icons_icons.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int index;
  CustomBottomNavigationBar({Key key, this.index}) : super(key: key);

  _handleBottomNavigation(BuildContext context, int index) {
    if (index == 0) {}
    if (index == 1) {}
    if (index == 2) {}
    if (index == 3) {}
    if (index == 4) {}
  }

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Icon(AppIcons.home, size: 20),
      ),
      label: 'HOME',
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Icon(AppIcons.woman),
      ),
      label: 'WOMEN',
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Icon(AppIcons.men),
      ),
      label: 'MEN',
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Icon(AppIcons.catalog),
      ),
      label: 'CATALOG',
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Icon(Icons.more_horiz, size: 32),
      ),
      label: 'MORE',
    )
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.125,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          showUnselectedLabels: true,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(letterSpacing: 1.0, fontSize: 10.0),
          unselectedLabelStyle: TextStyle(letterSpacing: 1.0, fontSize: 10.0),
          items: items,
          currentIndex: this.index,
          onTap: (index) => _handleBottomNavigation(context, index),
        ),
      ),
    );
  }
}
