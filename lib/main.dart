import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presenter/cripto_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        title: 'Warren Everest Challenge',
        debugShowCheckedModeBanner: false,
        home: CriptoScreen(),
      ),
    ),
  );
}
