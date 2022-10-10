import 'package:flutter/material.dart';

import '../../portfolio/model/criptos_view_data.dart';

class ConversionBalanceAvailable extends StatelessWidget {
  final CriptoViewData criptoViewData;
  final double criptoConversion;

  const ConversionBalanceAvailable({
    Key? key,
    required this.criptoViewData,
    required this.criptoConversion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Saldo disponível',
              style: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            ),
            Text(
              '${criptoConversion.toStringAsFixed(8)} ${criptoViewData.symbol.toUpperCase()}',
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
