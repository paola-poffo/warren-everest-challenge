// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:warren_everest_challenge/revision/widgets/revision_info.dart';

import '../../portfolio/model/criptos_view_data.dart';
import 'revision_button.dart';

class RevisionScreenBody extends StatelessWidget {
  final String convertQuantity;
  final String receiveQuantity;
  final CriptoViewData criptoConversion;
  final CriptoViewData criptoReceive;

  const RevisionScreenBody({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.criptoConversion,
    required this.criptoReceive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Text(
              'Revise os dados da sua conversão',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(),
          RevisionInfo(
            convertQuantity: convertQuantity,
            receiveQuantity: receiveQuantity,
            criptoConversion: criptoConversion,
            criptoReceive: criptoReceive,
          ),
          const SizedBox(height: 20),
          const RevisionButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
