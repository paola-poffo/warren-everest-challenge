import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RevisionDefaultAppbar extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  const RevisionDefaultAppbar( {Key? key}) : super(key: key);

  @override
  ConsumerState<RevisionDefaultAppbar> createState() => _RevisionDefaultAppbarState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}

class _RevisionDefaultAppbarState extends ConsumerState<RevisionDefaultAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
        title: const Text(
          'Revisar',
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