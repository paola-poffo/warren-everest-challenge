import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/view/cripto_screen.dart';

class ConfirmedScreenDefaultAppBar extends ConsumerWidget
    implements PreferredSizeWidget {
  const ConfirmedScreenDefaultAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pushNamed(
              context,
              CriptoScreen.route,
            );
          },
        ),
      ),
    );
  }
}
