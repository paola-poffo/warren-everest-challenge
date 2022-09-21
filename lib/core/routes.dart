// import '../portfolio/view/cripto_screen.dart';
// import '../transactions/view/transactions_screen.dart';

import '../conversion/view/conversion_screen.dart';
import '../details/view/details_screen.dart';
import '../portfolio/view/cripto_screen.dart';
import '../transactions/view/transactions_screen.dart';

var routesNavigation = {
  CriptoScreen.route: (context) => const CriptoScreen(),
  TransactionsScreen.route: (context) => const TransactionsScreen(),
  //DetailsScreen.route: (context) =>  const DetailsScreen(),
  ConversionScreen.route: (context) =>  const ConversionScreen(),
};
