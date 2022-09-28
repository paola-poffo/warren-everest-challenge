// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:warren_everest_challenge/portfolio/model/criptos_view_data.dart';

import '../../shared/utils/arguments.dart';
import '../../shared/utils/currency_formatter.dart';
import '../providers/visibility_provider.dart';

class CriptoType extends HookConsumerWidget {
  final CriptoViewData criptoViewData;
  final double criptoConversion;

  const CriptoType({
    Key? key,
    required this.criptoViewData,
    required this.criptoConversion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateVisible = ref.watch(visibilityProvider.state);

    return Column(
      children: [
        const Divider(thickness: 1),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 8),
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: NetworkImage(criptoViewData.image),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        criptoViewData.symbol.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 19,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        criptoViewData.name,
                        style: const TextStyle(
                          color: Color.fromRGBO(117, 118, 128, 1),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  stateVisible.state
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              FormatCurrency.format(
                                  criptoViewData.currentPrice),
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  '${criptoConversion.toStringAsFixed(2)} ${criptoViewData.symbol.toUpperCase()}',
                                  style: const TextStyle(
                                    color: Color.fromRGBO(117, 118, 128, 1),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 110,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: 80,
                              height: 18,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () {
                      Navigator.pushNamed(context, '/details',
                          arguments: Argument(criptosViewData: criptoViewData, criptoConversion: criptoConversion),);
                    },
                    color: const Color.fromRGBO(117, 118, 128, 1),
                    iconSize: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
