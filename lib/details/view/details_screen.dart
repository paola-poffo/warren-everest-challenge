// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../widgets/default_appbar_details.dart';

// import '../../shared/use_cases/model/cripto_model.dart';
// import '../../shared/utils/arguments.dart';
// import '../../shared/provider/cripto_provider.dart';
// import '../widgets/body_details.dart';

// class DetailsScreen extends HookConsumerWidget {
//   static const route = '/details';

//   const DetailsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//     final args = ModalRoute.of(context)!.settings.arguments as Arguments;
//     CriptoModel cripto = args.criptoModelApi;
//     ref.read(criptoProvider.notifier).state = cripto;
//     ref.read(currentPriceProvider.notifier).state = cripto.currentPrice;
//     return const SafeArea(
//       child: Scaffold(
//         appBar: DefaultAppbarDetails(),
//         body: BodyDetails(),
//       ),
//     );
//   }
// }
