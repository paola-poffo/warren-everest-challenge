import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/providers/providers.dart';

class CriptoType extends StatefulHookConsumerWidget {
  final String name;
  final String abbreviation;
  final double value;
  final double done;
  final String image;

  const CriptoType({
    Key? key,
    required this.name,
    required this.abbreviation,
    required this.value,
    required this.done,
    required this.image,
  }) : super(key: key);

  @override
  ConsumerState<CriptoType> createState() => _CriptoTypeState();
}

class _CriptoTypeState extends ConsumerState<CriptoType> {
  @override
  Widget build(BuildContext context) {
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
                    backgroundImage: AssetImage(widget.image),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.abbreviation,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 19,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.name,
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
                              NumberFormat.simpleCurrency(locale: 'pt-BR')
                                  .format(widget.value),
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  widget.done.toString(),
                                  style: const TextStyle(
                                    color: Color.fromRGBO(117, 118, 128, 1),
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  widget.abbreviation,
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
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                        onPressed: () {},
                        color: const Color.fromRGBO(117, 118, 128, 1),
                        iconSize: 18,
                      ),
                    ],
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
