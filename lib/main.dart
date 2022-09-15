import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_everest_challenge/portfolio/view/cripto_screen.dart';

import 'core/routes.dart';


void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Warren Everest Challenge',
        debugShowCheckedModeBanner: false,
        initialRoute: CriptoScreen.route,
        routes: routesNavigation,
      ),
    ),
  );
}
