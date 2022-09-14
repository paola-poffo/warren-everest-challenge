// import '../portfolio/view/cripto_screen.dart';
// import '../transactions/view/transactions_screen.dart';

import '../portfolio/view/cripto_screen.dart';
import '../shared/widgets/bottom_navigation.dart';
import '../transactions/view/transactions_screen.dart';

var routesNavigation = {
  '/': (context) => const BottomNavigation(),
  '/portfolio': (context) => const CriptoScreen(),
  '/transactions': (context) => const TransactionsScreen(),
};
