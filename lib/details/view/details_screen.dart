import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_everest_challenge/portfolio/model/criptos_view_data.dart';
import '../widgets/default_appbar_details.dart';
import '../widgets/body_details.dart';

class DetailsScreen extends HookConsumerWidget {
  const DetailsScreen({Key? key, required CriptosViewData criptoViewData}) : super(key: key);

  static const route = '/details';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as CriptosViewData;
    CriptosViewData criptosViewData = args;

    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppbarDetails(),
        body: BodyDetails(criptosViewData: criptosViewData),
      ),
    );
  }
}
