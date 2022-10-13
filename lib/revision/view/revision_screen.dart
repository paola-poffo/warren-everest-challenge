import 'package:flutter/material.dart';

import '../../portfolio/model/criptos_view_data.dart';
import '../widgets/revision_body.dart';
import '../widgets/revision_default_app_bar.dart';

class RevisionScreen extends StatelessWidget {
  final String convertQuantity;
  final String receiveQuantity;
  final CriptoViewData criptoConversion;
  final CriptoViewData criptoReceive;
  final String total;
  final double discount;
  final double increase;
  final String idDiscount;
  final String idIncrease;

  const RevisionScreen({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.criptoConversion,
    required this.criptoReceive,
    required this.total,
    required this.discount,
    required this.increase,
    required this.idDiscount,
    required this.idIncrease,
  }) : super(key: key);

  static const route = '/revision';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RevisionDefaultAppbar(),
      body: RevisionScreenBody(
        convertQuantity: convertQuantity,
        receiveQuantity: receiveQuantity,
        criptoConversion: criptoConversion,
        criptoReceive: criptoReceive,
        total: total,
        discount: discount,
        increase: increase,
        idDiscount: idDiscount,
        idIncrease: idIncrease,
      ),
    );
  }
}
