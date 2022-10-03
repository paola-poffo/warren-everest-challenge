import 'package:flutter/material.dart';

import '../conversion/widgets/conversion_body.dart';
import '../details/view/details_screen.dart';
import '../portfolio/view/cripto_screen.dart';
import '../shared/utils/arguments.dart';
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
      final argument = settings.arguments as Argument;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return DetailsScreen(
            criptoViewData: argument.criptoViewData,
            criptoConversion: argument.criptoConversion,
          );
        },
      );
    } else if (settings.name == ConversionBody.route) {
      final argument = settings.arguments as Argument;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return ConversionBody(
            criptoViewData: argument.criptoViewData,
            criptoConversion: argument.criptoConversion,
          );
        },
      );
    }
    return null;
  }
}
