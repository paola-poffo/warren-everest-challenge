import 'package:flutter/material.dart';

import '../../core/asset.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/cripto');
          break;
        case 1:
          Navigator.pushReplacementNamed(context, '/transactions');
          break;
      }
    }

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
          label: 'Movimentações',
        ),
      ],
      selectedItemColor: const Color.fromRGBO(224, 43, 87, 1),
      currentIndex: widget.index,
      onTap: onItemTapped,
    );
  }
}
