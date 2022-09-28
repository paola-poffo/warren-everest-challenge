import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/day_provider.dart';

class ButtonDay extends StatefulHookConsumerWidget {
  final int daysButton;
  final String title;
  const ButtonDay({
    Key? key,
    required this.daysButton,
    required this.title,
  }) : super(key: key);

  @override
  ConsumerState<ButtonDay> createState() => _ButtonDayState();
}

class _ButtonDayState extends ConsumerState<ButtonDay> {
  @override
  Widget build(BuildContext context) {
    var days = ref.watch(dayProvider.state);

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
