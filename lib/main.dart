import 'package:flutter/material.dart';

import 'presenter/cripto_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Warren Everest Challenge',
      debugShowCheckedModeBanner: false,
      home: CriptoScreen(),
    );
  }
}
