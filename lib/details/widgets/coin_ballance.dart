// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../shared/provider/cripto_provider.dart';
// import '../../shared/utils/currency_formatter.dart';

// class CoinBallance extends HookConsumerWidget {
//   const CoinBallance({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var cripto = ref.watch(criptoProvider.notifier).state;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               cripto.name,
//               style: const TextStyle(
//                 fontSize: 34,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             CircleAvatar(
//               radius: 25,
//               backgroundImage: AssetImage(cripto.image),
//             ),
//           ],
//         ),
//         Text(
//           cripto.abbreviation,
//           style: const TextStyle(
//             color: Color.fromRGBO(117, 118, 128, 1),
//             fontSize: 17,
//           ),
//         ),
//         const SizedBox(height: 15),
//         Text(
//           FormatCurrency.format(cripto.allPrices.first),
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 32,
//           ),
//         ),
//       ],
//     );
//   }
// }
