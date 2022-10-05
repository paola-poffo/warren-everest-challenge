import 'package:flutter/material.dart';

import '../widgets/rev_default_app_bar.dart';

class RevisionScreen extends StatefulWidget {
  const RevisionScreen({
    Key? key,
  }) : super(key: key);

  static const route = '/revision';

  @override
  State<RevisionScreen> createState() => _RevisionScreenState();
}

class _RevisionScreenState extends State<RevisionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: RevisionDefaultAppbar(),
      body: Center(
        child: Text('Em breve'),
      ),
    );
  }
}
