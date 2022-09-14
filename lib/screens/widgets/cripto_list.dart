import 'package:flutter/material.dart';
import 'package:warren_everest_challenge/screens/widgets/cripto_type.dart';

import '../../use_cases/model/cripto_model.dart';

class CriptoList extends StatelessWidget {
  const CriptoList({required this.criptos, Key? key}) : super(key: key);

  final List<CriptoModel> criptos;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: criptos.length,
        itemBuilder: (context, index) {
          CriptoModel cripto = criptos[index];
          return CriptoType(
            criptoModel: cripto,
          );
        },
      ),
    );
  }
}
