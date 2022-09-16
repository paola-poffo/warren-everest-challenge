import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefaultAppbar extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  const DefaultAppbar( {Key? key}) : super(key: key);

  @override
  ConsumerState<DefaultAppbar> createState() => _DefaultAppbarState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}

class _DefaultAppbarState extends ConsumerState<DefaultAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
        title: const Text(
          'Detalhes',
          style: TextStyle(
            fontSize: 21,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
