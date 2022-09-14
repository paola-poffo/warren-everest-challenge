import 'package:flutter/material.dart';
import '../../core/asset.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(warren),
            ),
            label: 'Portifólio'),
        BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(movements),
            ),
            label: 'Movimentações'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color.fromRGBO(224, 43, 87, 1),
      onTap: _onItemTapped,
    );
  }
}
