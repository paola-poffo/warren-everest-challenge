import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'widgets/visible_button.dart';
import '../shared/widgets/bottom_navigation.dart';
import '../shared/providers/providers.dart';
import '../core/asset.dart';
import 'widgets/cripto_type.dart';

class CriptoScreen extends StatefulHookConsumerWidget {
  const CriptoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CriptoScreen> createState() => _CriptoScreenState();
}

class _CriptoScreenState extends ConsumerState<CriptoScreen> {
  @override
  Widget build(BuildContext context) {
    var stateVisible = ref.watch(visibilityProvider.state);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
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
                          NumberFormat.simpleCurrency(locale: 'pt-BR')
                              .format(14798.00),
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
            ),
            Expanded(
              child: ListView(
                children: const [
                  CriptoType(
                    name: 'Bitcoin',
                    abbreviation: 'BTC',
                    value: 6557.00,
                    done: 0.65,
                    image: btc,
                  ),
                  CriptoType(
                    name: 'Ethereum',
                    abbreviation: 'ETH',
                    value: 7996.00,
                    done: 0.94,
                    image: eth,
                  ),
                  CriptoType(
                    name: 'Litecoin',
                    abbreviation: 'LTC',
                    value: 245.00,
                    done: 0.82,
                    image: ltc,
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );


  }
}
