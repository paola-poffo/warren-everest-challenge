import 'package:flutter/material.dart';


import '../../portfolio/model/criptos_view_data.dart';

class ConversionBalanceAvailable extends StatelessWidget {
  CriptoViewData criptoViewData;
  double criptoConversion;
  ConversionBalanceAvailable({
    Key? key,
    required this.criptoViewData,
    required this.criptoConversion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 245, 245, 250),
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Saldo disponível',
            style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
          ),
          Text(
            '${criptoConversion.toStringAsFixed(5)} ${criptoViewData.symbol.toUpperCase()}',
            style: const TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
