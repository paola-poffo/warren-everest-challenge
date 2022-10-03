import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/criptos_view_data.dart';
import '../../portfolio/providers/cripto_provider.dart';

class ConversionDropDown extends ConsumerWidget {
  final CriptoViewData criptoViewData;
  final void Function(CriptoViewData?) onChangedDropdown;

  const ConversionDropDown({
    Key? key,
    required this.criptoViewData,
    required this.onChangedDropdown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final criptoProvider = ref.watch(criptosProvider);

    List<CriptoViewData> listCoins = [];

    for (CriptoViewData cripto in criptoProvider.value!) {
      listCoins.add(cripto);
    }

    return SizedBox(
      height: 40,
      width: 120,
      child: DropdownButtonFormField(
        items: listCoins.map<DropdownMenuItem<CriptoViewData>>(
          (CriptoViewData criptoViewData) {
            return DropdownMenuItem(
              value: criptoViewData,
              child: Row(
                children: [
                  Image.network(
                    criptoViewData.image,
                    scale: 13,
                  ),
                  const SizedBox(width: 4),
                  Text(criptoViewData.symbol.toUpperCase()),
                ],
              ),
            );
          },
        ).toList(),
        onChanged: onChangedDropdown,
        value: criptoViewData,
        icon: const Icon(
          Icons.expand_more,
          color: Color.fromRGBO(117, 118, 128, 1),
          size: 17,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: Color.fromRGBO(227, 228, 235, 1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: Color.fromRGBO(224, 43, 87, 1),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
