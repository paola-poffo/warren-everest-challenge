import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_everest_challenge/portfolio/providers/balance_provider_api.dart';

import '../../shared/utils/currency_formatter.dart';
import '../providers/visibility_provider.dart';
import 'visible_button.dart';

class AllBalance extends StatefulHookConsumerWidget {
  const AllBalance({super.key});

  @override
  ConsumerState<AllBalance> createState() => _AllBalanceState();
}

class _AllBalanceState extends ConsumerState<AllBalance> {
  @override
  Widget build(BuildContext context) {
    var ballance = ref.watch(ballanceProviderApi.notifier).state;
    var stateVisible = ref.watch(visibilityProvider.state);

    return Container(
      margin: const EdgeInsets.only(right: 10, left: 20),
      padding: const EdgeInsets.only(top: 10, bottom: 20),
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
                  FormatCurrency.doubleFormat(ballance),
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
