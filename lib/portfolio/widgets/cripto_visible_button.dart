import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/visibility_provider.dart';

class CriptoVisibleButton extends StatefulHookConsumerWidget {
  const CriptoVisibleButton({Key? key}) : super(key: key);

  @override
  ConsumerState<CriptoVisibleButton> createState() => _CriptoVisibleButtonState();
}

class _CriptoVisibleButtonState extends ConsumerState<CriptoVisibleButton> {
  @override
  Widget build(BuildContext context) {
    var stateVisible = ref.watch(visibilityProvider.state);

    return IconButton(
      onPressed: () {
        setState(
          () {
            stateVisible.state = !stateVisible.state;
          },
        );
      },
      icon: Icon(
          stateVisible.state ? Icons.remove_red_eye : Icons.visibility_off),
    );
  }
}
