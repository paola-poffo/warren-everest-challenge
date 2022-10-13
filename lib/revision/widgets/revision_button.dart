import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/criptos_view_data.dart';
import '../../portfolio/providers/cripto_conversion_provider.dart';
import '../../portfolio/providers/cripto_provider.dart';
import '../../transactions/model/transactions_model.dart';
import '../../transactions/providers/transactions_provider.dart';
import '../view/confirmed_screen.dart';

class RevisionButton extends HookConsumerWidget {
  final String convertQuantity;
  final String receiveQuantity;
  final CriptoViewData criptoConversion;
  final CriptoViewData criptoReceive;
  final String total;
  final double increase;
  final double discount;
  final String idDiscount;
  final String idIncrease;
  const RevisionButton({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.criptoConversion,
    required this.criptoReceive,
    required this.total,
    required this.increase,
    required this.discount,
    required this.idDiscount,
    required this.idIncrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movements = ref.watch(transactionsProvider.state).state;
    final criptos = ref.watch(criptosProvider);
    TransactionsModel model = TransactionsModel(
      converted: '$convertQuantity ${criptoConversion.symbol.toUpperCase()}',
      received: receiveQuantity,
      value: total,
      date: DateTime.now(),
      increase: increase,
      discount: discount,
      idDiscount: idDiscount,
      idIncrease: idIncrease,
    );
    void getBalance() {
      Future.delayed(
        Duration.zero,
        () {
          int discountIndex = criptos.asData!.value
              .indexWhere((result) => idDiscount == result.id);
          int increaseIndex = criptos.asData!.value
              .indexWhere((result) => idIncrease == result.id);

          for (CriptoViewData cripto in criptos.asData!.value) {
            if (model.idDiscount == cripto.id) {
              ref.read(criptoConversionProvider)[discountIndex] -=
                  model.discount;
            } else if (model.idIncrease == cripto.id) {
              ref.read(criptoConversionProvider)[increaseIndex] +=
                  model.increase;
            }
          }
        },
      );
    }

    return Align(
      child: MaterialButton(
        height: 60,
        padding: const EdgeInsets.only(left: 115, right: 115),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: const Color.fromRGBO(224, 43, 87, 1),
        onPressed: () {
          Navigator.of(context).push(_createRoute());
          movements.add(model);
          getBalance();
        },
        child: const Text(
          'Concluir conversão',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ConfirmedScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.linearToEaseOut;

      var tween = Tween(
        begin: begin,
        end: end,
      ).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
