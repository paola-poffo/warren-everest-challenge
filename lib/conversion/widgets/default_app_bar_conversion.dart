import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefaultAppbarConversion extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  const DefaultAppbarConversion( {Key? key}) : super(key: key);

  @override
  ConsumerState<DefaultAppbarConversion> createState() => _DefaultAppbarConversionState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}

class _DefaultAppbarConversionState extends ConsumerState<DefaultAppbarConversion> {
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
