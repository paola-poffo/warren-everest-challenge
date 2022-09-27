import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/routes.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        title: 'Warren Everest Challenge',
        initialRoute: '/cripto',
        onGenerateRoute: Routes.findRoute,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
