import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_everest_challenge/shared/use_cases/model/cripto_model_api.dart';

import '../../shared/utils/currency_formatter.dart';
import '../providers/visibility_provider.dart';

class CriptoType extends HookConsumerWidget {
  final CriptoModelApi criptoModelApi;

  CriptoType({required this.criptoModelApi, Key? key}) : super(key: key);

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
                    backgroundImage: NetworkImage(criptoModelApi.image),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        criptoModelApi.symbol.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 19,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        criptoModelApi.name,
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
                              FormatCurrency.doubleFormat(
                                  criptoModelApi.currentPrice),
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  criptoModelApi.symbol.toUpperCase(),
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
                          arguments: criptoModelApi);
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
