import 'package:flutter/material.dart';
import 'cripto_balance.dart';
import 'cripto_list.dart';

class CriptoBody extends StatelessWidget {
  const CriptoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CriptoBalance(),
        CriptoList(),
      ],
    );
  }
}
