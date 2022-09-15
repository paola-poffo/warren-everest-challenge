import 'package:flutter/material.dart';
import 'package:warren_everest_challenge/transactions/view/transactions_screen.dart';

import '../../core/asset.dart';
import '../../portfolio/view/cripto_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int navIndex = 0;
  final changeController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: changeController,
        children: const <Widget>[
          CriptoScreen(),
          TransactionsScreen(),
        ],
        onPageChanged: (change) {
          navIndex = change;
          setState(() {});
        },
      ),
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
        onTap: (index) {
          navIndex = index;
          changeController.jumpToPage(
            index,
          );
          setState(() {});
        },
      ),
    );
  }
}
