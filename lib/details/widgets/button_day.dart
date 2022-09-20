import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/provider/day_provider.dart';
import '../../shared/provider/cripto_provider.dart';

class ButtonDay extends StatefulHookConsumerWidget {
  final int daysButton;
  final String title;
  const ButtonDay({Key? key, required this.daysButton, required this.title})
      : super(key: key);

  @override
  ConsumerState<ButtonDay> createState() => _ButtonDayState();
}

class _ButtonDayState extends ConsumerState<ButtonDay> {
  @override
  Widget build(BuildContext context) {
    var days = ref.watch(dayProvider.state);
    var oneCripto = ref.watch(criptoProvider.notifier).state;

    Color getButtonColor() {
      if (widget.daysButton == days.state) {
        return Colors.grey.shade200;
      } else {
        return Colors.white;
      }
    }

    return InkWell(
      onTap: () {
        setState(
          () {
            days.state = widget.daysButton;
            getButtonColor();
            ref.read(criptoProvider.notifier).getchangeVariation(widget.daysButton);
            ref.read(currentPriceProvider.notifier).getCurrentPrice(widget.daysButton, oneCripto);
            oneCripto.currentPrice = ref.read(currentPriceProvider.notifier).state;
            oneCripto.variation = ref.read(criptoProvider.notifier).state.variation;
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: getButtonColor(),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
