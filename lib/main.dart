import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_everest_challenge/core/routes.dart';

import 'screens/cripto_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        initialRoute: CriptoScreen.route,
        routes: routesDestination,
        title: 'Warren Everest Challenge',
        debugShowCheckedModeBanner: false,
        home: CriptoScreen(),
      ),
    ),
  );
}
