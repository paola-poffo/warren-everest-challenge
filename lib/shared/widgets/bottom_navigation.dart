import 'package:flutter/material.dart';


import '../../core/asset.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int navIndex = 0;
  late PageController changeController = PageController(initialPage: 0);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
        selectedItemColor: const Color.fromRGBO(224, 43, 87, 1),
        currentIndex: navIndex,
        onTap: onTap,
        },
      ),
    );
  }
}
