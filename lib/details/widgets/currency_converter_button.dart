// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:warren_everest_challenge/portfolio/model/criptos_view_data.dart';

class CurrencyConverterButton extends StatelessWidget {
  const CurrencyConverterButton({
    Key? key,
    required this.criptosViewData,
  }) : super(key: key);
  final CriptosViewData criptosViewData;
  
  @override
  Widget build(BuildContext context) {
    return Align(
      child: MaterialButton(
        padding: const EdgeInsets.only(left: 115, right: 115),
        height: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: const Color.fromRGBO(224, 43, 87, 1),
        onPressed: () {
          Navigator.pushNamed(context, '/conversion',
              arguments: criptosViewData);
        },
        child: const Text(
          'Converter Moeda',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
