import 'package:flutter/material.dart';

import '../conversion/view/conversion_screen.dart';
import '../details/view/details_screen.dart';
import '../portfolio/model/criptos_view_data.dart';
import '../portfolio/view/cripto_screen.dart';
import '../transactions/view/transactions_screen.dart';

class Routes {
  static Route<dynamic>? findRoute(settings) {
    if (settings.name == CriptoScreen.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const CriptoScreen();
        },
      );
    } else if (settings.name == TransactionsScreen.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const TransactionsScreen();
        },
      );
    } else if (settings.name == DetailsScreen.route) {
      final argument = settings.arguments as CriptosViewData;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return DetailsScreen(
            criptoViewData: argument,
          );
        },
      );
    } else if (settings.name == ConversionScreen.route) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return const ConversionScreen();
        },
      );
    }
    return null;
  }
}