import 'package:flutter/material.dart';

import '../models/bottom_nav_items.model.dart';

//TODO: create custom bottom navigation bar

const navigationItems = [
  {
    'label': BottomNavItems.home,
    'icon': Icon(Icons.home_rounded),
  },
  {
    'label': BottomNavItems.profile,
    'icon': Icon(Icons.account_circle_outlined),
  }
];

class BottomNavBar extends StatefulWidget {
  final Function(String) onItemClick;

  const BottomNavBar(this.onItemClick, {Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  _onItemClick(int itemNo) {
    setState(() {
      _selectedIndex = itemNo;
    });
    widget.onItemClick(navigationItems[itemNo]['label'] as String);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: navigationItems
          .map((item) => BottomNavigationBarItem(
                icon: item['icon'] as Widget,
                label: item['label'] as String,
              ))
          .toList(),
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      onTap: _onItemClick,
    );
  }
}
