// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:warren_everest_challenge/portfolio/model/criptos_view_data.dart';

import '../widgets/details_body.dart';
import '../widgets/default_appbar_details.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.criptosViewData,
    required this.criptoConversion,
  }) : super(key: key);

  final CriptoViewData criptosViewData;
  final double criptoConversion;

  static const route = '/details';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppbarDetails(),
        body: DetailsBody(
          criptosViewData: criptosViewData,
          criptoConversion: criptoConversion,
        ),
      ),
    );
  }
}
