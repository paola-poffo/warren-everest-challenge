import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConversionDefaultAppbar extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  const ConversionDefaultAppbar( {Key? key}) : super(key: key);

  @override
  ConsumerState<ConversionDefaultAppbar> createState() => _ConversionDefaultAppbarState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}

class _ConversionDefaultAppbarState extends ConsumerState<ConversionDefaultAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
        title: const Text(
          'Converter',
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
