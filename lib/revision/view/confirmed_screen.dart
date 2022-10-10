import 'package:flutter/material.dart';

import '../widgets/confirmed_screen_default_app_bar.dart';
import '../widgets/confirmed_body.dart';

class ConfirmedScreen extends StatelessWidget {
  const ConfirmedScreen({Key? key}) : super(key: key);

  static const route = '/confirmed';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ConfirmedScreenDefaultAppBar(),
      body: ConfirmedScreenBody(),
    );
  }
}
