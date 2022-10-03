import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/arguments.dart';

class ConversionFloatingActionButton extends StatelessWidget {
  const ConversionFloatingActionButton({
    Key? key,
    required this.done,
    required this.argument,
  }) : super(key: key);

  final StateController<bool> done;
  final Argument argument;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: done.state
          ? () {
              Navigator.of(context).pushNamed(
                '/revision',
                arguments: Argument(
                  criptoViewData: argument.criptoViewData,
                  criptoConversion: argument.criptoConversion,
                ),
              );
            }
          : null,
      backgroundColor: done.state
          ? const Color.fromRGBO(224, 43, 87, 1)
          : const Color.fromRGBO(201, 202, 212, 1),
      elevation: 0,
      child: const Icon(Icons.navigate_next),
    );
  }
}