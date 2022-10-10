import 'package:flutter/material.dart';
import '../../shared/widgets/bottom_navigation.dart';
import '../widgets/cripto_body.dart';

class CriptoScreen extends StatelessWidget {
  const CriptoScreen({Key? key}) : super(key: key);

  static const route = '/cripto';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CriptoBody(),
        bottomNavigationBar: BottomNavigation(index: 0),
      ),
    );
  }
}
