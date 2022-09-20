import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/utils/arguments.dart';
import '../../shared/use_cases/model/cripto_model.dart';

import '../../shared/utils/currency_formatter.dart';
import '../providers/visibility_provider.dart';

class CriptoType extends HookConsumerWidget {
  final CriptoModel criptoModel;

  const CriptoType({required this.criptoModel, Key? key}) : super(key: key);

  double allPriceChange() {
    return (criptoModel.allPrices.first.toDouble() /
                criptoModel.allPrices[1].toDouble() -
            1) *
        100;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(visibilityProvider.state);

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
                    backgroundImage: AssetImage(criptoModel.image),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        criptoModel.abbreviation,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 19,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        criptoModel.name,
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
                  visible.state
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              FormatCurrency.format(criptoModel.amount),
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  criptoModel.done.toString(),
                                  style: const TextStyle(
                                    color: Color.fromRGBO(117, 118, 128, 1),
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  criptoModel.abbreviation,
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
                      criptoModel.variation = allPriceChange();
                      Navigator.pushNamed(context, '/details',
                          arguments: Arguments(criptoModel: criptoModel));
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
