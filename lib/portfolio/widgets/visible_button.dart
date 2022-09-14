import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/visibility_provider.dart';

class VisibleButton extends StatefulHookConsumerWidget {
  const VisibleButton({Key? key}) : super(key: key);

  @override
  ConsumerState<VisibleButton> createState() => _VisbleButtonState();
}

class _VisbleButtonState extends ConsumerState<VisibleButton> {

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
