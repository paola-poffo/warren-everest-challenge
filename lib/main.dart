import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/routes.dart';


void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Warren Everest Challenge',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: routesNavigation,
      ),
    ),
  );
}
