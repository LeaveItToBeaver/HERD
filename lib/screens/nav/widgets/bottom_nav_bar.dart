import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herd/enums/bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  final Map<BottomNavItem, IconData> items;
  final BottomNavItem selectedItem;
  final Function(int) onTap;

  const BottomNavBar({
    Key key,
    @required this.items,
    @required this.selectedItem,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      currentIndex: BottomNavItem.values.indexOf(selectedItem),
      onTap: onTap,
      items: items
          .map((item, icon) => MapEntry(
        item.toString(),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(icon, size: 25.0),
        ),
      ))
          .values
          .toList(),
    );
  }
}