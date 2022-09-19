import 'package:flutter/material.dart';

class CurrencyConverterButton extends StatelessWidget {
  const CurrencyConverterButton({
    Key? key,
  }) : super(key: key);

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
           Navigator.pushNamed(context, '/conversion');
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
