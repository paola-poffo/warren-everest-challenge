// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:intl/intl.dart';

// import '../../portfolio/model/criptos_view_data.dart';
// import '../provider/single_cripto_provider.dart';
// import 'conversion_floating_action_button.dart';

// class ConversionBottomSheet extends StatefulHookConsumerWidget {
//   final CriptoViewData criptoViewData;
//   final double criptoConversion;

//   const ConversionBottomSheet({
//     Key? key,
//     required this.criptoViewData,
//     required this.criptoConversion,
//   }) : super(key: key);

//   @override
//   ConsumerState<ConversionBottomSheet> createState() =>
//       _ConversionBottomSheetState();
// }

// class _ConversionBottomSheetState extends ConsumerState<ConversionBottomSheet> {
//   TextEditingController convertController = TextEditingController();

//   String formattingValue(String value) {
//     return value.replaceAll(RegExp(r'[^\w\s]+'), '.');
//   }

//   String getLastestValue() {
//     String value = formattingValue(convertController.text);

//     return value;
//   }

//   double convertLatestValue() {
//     double value = 0.0;
//     if (getLastestValue() == '' || getLastestValue() == '.') {
//       value = 0.0;
//     } else {
//       value =
//           double.parse(getLastestValue()) * widget.criptoViewData.currentPrice;
//     }
//     return value;
//   }

//   String formatLatestValue() {
//     String value = NumberFormat.simpleCurrency(locale: 'pt-br')
//         .format(convertLatestValue());
//     return value;
//   }

//   String getTotal(CriptoViewData cripto) {
//     if (convertLatestValue() == 0.0) {
//       return '0.00';
//     }
//     double total = convertLatestValue() / cripto.currentPrice;
//     return total.toStringAsFixed(8);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var singleCripto = ref.watch(singleCriptoProvider.state).state;
//     var convertedCripto = ref.watch(convertedCriptoProvider.state);

//     return Container(
//       height: 80,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 14,
//       ),
//       decoration: BoxDecoration(
//         border: Border(
//           top: BorderSide(
//             color: Colors.grey.shade300,
//             width: 1,
//           ),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Total estimado',
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Color.fromRGBO(117, 118, 128, 1),
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 '${getTotal(singleCripto)} ${convertedCripto.state.symbol.toUpperCase()}',
//                 style: const TextStyle(
//                   fontSize: 19,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//           const ConversionFloatingActionButton(),
//         ],
//       ),
//     );
//   }
// }
