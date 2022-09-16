import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/asset.dart';
import 'graphic.dart';

class BodyDetails extends StatefulHookConsumerWidget {
  const BodyDetails({Key? key}) : super(key: key);

  @override
  ConsumerState<BodyDetails> createState() => _BodyDetailsState();
}

class _BodyDetailsState extends ConsumerState<BodyDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Bitcoin',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(btc),
                ),
              ],
            ),
            Text(
              'BTC',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              NumberFormat.simpleCurrency(locale: 'pt-BR').format(
                double.parse('100000'),
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
            const Graphic(),
          ],
        ),
      ),
    );
  }
}
