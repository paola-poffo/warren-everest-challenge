import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/amount_provider.dart';
import '../../shared/utils/currency_formatter.dart';
import '../providers/visibility_provider.dart';
import 'visible_button.dart';

class CriptoBalance extends StatefulHookConsumerWidget {
  const CriptoBalance({super.key});

  @override
  ConsumerState<CriptoBalance> createState() => _CriptoBalanceState();
}

class _CriptoBalanceState extends ConsumerState<CriptoBalance> {
  @override
  Widget build(BuildContext context) {
    final balance = ref.watch(amountProvider.state);
    final stateVisible = ref.watch(visibilityProvider.state);

    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cripto",
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(224, 43, 87, 1),
                ),
              ),
              const VisibleButton(),
            ],
          ),
          stateVisible.state
              ? Text(
                  FormatCurrency.format(balance.state),
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                )
              : Container(
                  width: 210,
                  height: 39,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
          const SizedBox(height: 6),
          const Text(
            "Valor total de moedas",
            style: TextStyle(
              fontSize: 17,
              color: Color.fromRGBO(117, 118, 128, 1),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
