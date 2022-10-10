// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../conversion/provider/single_cripto_provider.dart';
import '../../portfolio/model/criptos_view_data.dart';
import 'revision_list.dart';

class RevisionInfo extends ConsumerWidget {
  final String convertQuantity;
  final String receiveQuantity;
  final CriptoViewData criptoConversion;
  final CriptoViewData criptoReceive;
  const RevisionInfo({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.criptoConversion,
    required this.criptoReceive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singleCripto = ref.watch(singleCriptoProvider.state);
    final convertedCripto = ref.watch(convertedCriptoProvider.state);



    return Wrap(
      children: [
        RevisionList(
          title: 'Converter',
          data: '$convertQuantity ${criptoConversion.symbol.toUpperCase()}',
        ),
        RevisionList(
          title: 'Receber',
          data:
              '$receiveQuantity ${convertedCripto.state.symbol.toUpperCase()}',
        ),
        RevisionList(
          title: 'Câmbio',
          data: '1 ${singleCripto.state.symbol.toUpperCase()} = $receiveQuantity ${convertedCripto.state.symbol.toUpperCase()}'
        ),
      ],
    );
  }
}
