import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailsDefaultAppbar extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  const DetailsDefaultAppbar( {Key? key}) : super(key: key);

  @override
  ConsumerState<DetailsDefaultAppbar> createState() => _DetailsDefaultAppbarState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}

class _DetailsDefaultAppbarState extends ConsumerState<DetailsDefaultAppbar> {
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
