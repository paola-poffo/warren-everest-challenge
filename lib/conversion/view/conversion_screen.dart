import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../portfolio/model/criptos_view_data.dart';
import '../../portfolio/providers/cripto_provider.dart';
import '../../shared/utils/arguments.dart';
import '../widgets/conversion_body.dart';
import '../widgets/conversion_default_app_bar.dart';

class ConversionScreen extends StatefulHookConsumerWidget {
  static const route = '/conversion';
  final CriptoViewData criptoViewData;
  final double criptoConversion;

  const ConversionScreen({
    Key? key,
    required this.criptoViewData,
    required this.criptoConversion,
  }) : super(key: key);

  @override
  ConsumerState<ConversionScreen> createState() => _ConversionState();
}

class _ConversionState extends ConsumerState<ConversionScreen> {
  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as Argument;
    final criptoProvider = ref.watch(criptosProvider);

    return criptoProvider.when(
      data: (data) {
        return Scaffold(
          appBar: const ConversionDefaultAppbar(),
          body: ConversionBody(
            argument: argument,
            widget: widget,
          ),
        );
      },
      error: (object, stackTracer) {
        return const Center(
          child: Text('Tente novamente em instantes'),
        );
      },
      loading: () {
        return const Center(
          child:
              CircularProgressIndicator(color: Color.fromRGBO(224, 43, 87, 1)),
        );
      },
    );
  }
}
