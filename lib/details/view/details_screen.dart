import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_everest_challenge/details/widgets/default_appbar.dart';

import '../widgets/body_details.dart';

class DetailsScreen extends StatefulHookConsumerWidget {
  static const route = '/details';
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: DefaultAppbar(),
        body: BodyDetails(),
      ),
    );
  }
}
