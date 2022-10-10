import 'package:flutter/material.dart';

import '../../shared/utils/arguments.dart';
import '../view/conversion_screen.dart';
import 'conversion_balance_available.dart';
import 'conversion_text.dart';
import 'conversion_form.dart';

class ConversionBody extends StatelessWidget {
  const ConversionBody({
    Key? key,
    required this.argument,
    required this.widget,
  }) : super(key: key);

  final Argument argument;
  final ConversionScreen widget;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ConversionBalanceAvailable(
            criptoViewData: argument.criptoViewData,
            criptoConversion: argument.criptoConversion,
          ),
          const ConversionText(),
          ConversionForm(
            criptoConversion: widget.criptoConversion,
            criptoViewData: widget.criptoViewData,
          ),
        ],
      ),
    );
  }
}
