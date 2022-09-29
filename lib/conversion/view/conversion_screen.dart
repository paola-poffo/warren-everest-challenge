// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../portfolio/model/criptos_view_data.dart';
import '../widgets/conversion_body.dart';
import '../widgets/conversion_default_app_bar.dart';

class ConversionScreen extends StatelessWidget {
  ConversionScreen({
    Key? key,
    required this.criptosViewData,
    required this.criptoConversion,
  }) : super(key: key);

  static const route = '/conversion';
  final CriptoViewData criptosViewData;
  final double criptoConversion;
  final TextEditingController convertController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ConversionDefaultAppbar(),
        body: ConversionBody(
          criptoViewData: criptosViewData,
          convertController: convertController,
          criptoConversion: criptoConversion,
        ),
      ),
    );
  }
}
