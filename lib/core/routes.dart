import 'package:flutter/material.dart';

import '../conversion/view/conversion_screen.dart';
import '../details/view/details_screen.dart';
import '../portfolio/view/cripto_screen.dart';
import '../revision/view/confirmed_screen.dart';
import '../revision/view/revision_screen.dart';
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
    } else if (settings.name == ConversionScreen.route) {
      final argument = settings.arguments as Argument;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return ConversionScreen(
            criptoViewData: argument.criptoViewData,
            criptoConversion: argument.criptoConversion,
          );
        },
      );
    } else if (settings.name == RevisionScreen.route) {
      final argument = settings.arguments as RevisionArguments;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return RevisionScreen(
            convertQuantity: argument.convertQuantity,
            receiveQuantity: argument.receiveQuantity,
            criptoConversion: argument.criptoConversion,
            criptoReceive: argument.criptoReceive,
            total: argument.total,
            discount: argument.discount,
            increase: argument.increase,
            idDiscount: argument.idDiscount,
            idIncrease: argument.idIncrease,
          );
        },
      );
    } else if (settings.name == ConfirmedScreen.route) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return const ConfirmedScreen();
        },
      );
    }
    return null;
  }
}
