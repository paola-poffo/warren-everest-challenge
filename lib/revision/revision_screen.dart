import 'package:flutter/material.dart';

import '../portfolio/model/criptos_view_data.dart';

class RevisionScreen extends StatefulWidget {
  final CriptoViewData criptoViewData;
  final double criptoConversion;

  const RevisionScreen({
    Key? key,
    required this.criptoViewData,
    required this.criptoConversion,
  }) : super(key: key);

  static const route = '/revision';

  @override
  State<RevisionScreen> createState() => _RevisionScreenState();
}

class _RevisionScreenState extends State<RevisionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('Em breve'),
    );
  }
}
