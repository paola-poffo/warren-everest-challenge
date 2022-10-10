// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:warren_everest_challenge/portfolio/model/criptos_view_data.dart';

import '../widgets/details_body.dart';
import '../widgets/details_default_appbar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.criptoViewData,
    required this.criptoConversion,
  }) : super(key: key);

  final CriptoViewData criptoViewData;
  final double criptoConversion;

  static const route = '/details';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DetailsDefaultAppbar(),
        body: DetailsBody(
          criptosViewData: criptoViewData,
          criptoConversion: criptoConversion,
        ),
      ),
    );
  }
}
