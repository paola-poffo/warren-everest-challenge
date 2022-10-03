import 'package:flutter/material.dart';

import '../../portfolio/model/criptos_view_data.dart';
import '../widgets/conversion_body.dart';
import '../widgets/conversion_default_app_bar.dart';
import '../widgets/conversion_floating_action_button.dart';

class ConversionScreen extends StatelessWidget {
  final CriptoViewData criptoViewData;
  final double criptoConversion;

  const ConversionScreen({
    Key? key,
    required this.criptoViewData,
    required this.criptoConversion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ConversionDefaultAppbar(),
        body: ConversionBody(
          criptoConversion: criptoConversion,
          criptoViewData: criptoViewData,
        ),
        floatingActionButton: ConversionFloatingActionButton(
          done: done,
          argument: argument,
        ),
      ),
    );
  }
}
