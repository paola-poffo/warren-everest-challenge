import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../portfolio/model/criptos_view_data.dart';
import '../../portfolio/providers/cripto_provider.dart';
import '../../shared/utils/arguments.dart';
import '../provider/single_cripto_provider.dart';
import 'conversion_bottom_sheet.dart';
import 'conversion_default_app_bar.dart';
import 'conversion_drop_down.dart';
import 'conversion_balance_available.dart';
import 'conversion_floating_action_button.dart';

class ConversionBody extends StatefulHookConsumerWidget {
  final CriptoViewData criptoViewData;
  final double criptoConversion;

  const ConversionBody({
    Key? key,
    required this.criptoViewData,
    required this.criptoConversion,
  }) : super(key: key);

  static const route = '/conversion';
  @override
  ConsumerState<ConversionBody> createState() => _ConversionBodyState();
}

class _ConversionBodyState extends ConsumerState<ConversionBody> {
  TextEditingController convertController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.watch(singleCriptoProvider.state).state = widget.criptoViewData;
    });
    convertController.addListener(getLastestValue);
  }

  String formattingValue(String value) {
    return value.replaceAll(RegExp(r'[^\w\s]+'), '.');
  }

  String getLastestValue() {
    String value = formattingValue(convertController.text);

    return value;
  }

  double convertLatestValue() {
    double value = 0.0;
    if (getLastestValue() == '' || getLastestValue() == '.') {
      value = 0.0;
    } else {
      value =
          double.parse(getLastestValue()) * widget.criptoViewData.currentPrice;
    }
    return value;
  }

  String formatLatestValue() {
    String value = NumberFormat.simpleCurrency(locale: 'pt-br')
        .format(convertLatestValue());
    return value;
  }

  String getTotal(CriptoViewData cripto) {
    if (convertLatestValue() == 0.0) {
      return '0.00';
    }
    double total = convertLatestValue() / cripto.currentPrice;
    return total.toStringAsFixed(8);
  }

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as Argument;
    final criptoProvider = ref.watch(criptosProvider);
    var singleCripto = ref.watch(singleCriptoProvider.state).state;
    var convertedCripto = ref.watch(convertedCriptoProvider.state);

    return criptoProvider.when(
      data: (data) {
        return Form(
          key: key,
          child: Scaffold(
            appBar: const ConversionDefaultAppbar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConversionBalanceAvailable(
                    criptoViewData: argument.criptoViewData,
                    criptoConversion: argument.criptoConversion,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    child: Text(
                      'Quanto você gostaria de converter?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConversionDropDown(
                        criptoViewData: singleCripto,
                        onChangedDropdown: (CriptoViewData? singlecriptos) {
                          singleCripto = singlecriptos!;
                          convertLatestValue();
                        },
                      ),
                      const Icon(
                        Icons.sync_alt,
                        color: Color.fromRGBO(224, 43, 87, 1),
                        size: 22,
                      ),
                      ConversionDropDown(
                        criptoViewData: convertedCripto.state,
                        onChangedDropdown: (CriptoViewData? convertedCriptos) {
                          convertedCripto.state = convertedCriptos!;
                          convertLatestValue();
                        },
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: convertController,
                    showCursor: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(224, 43, 87, 1),
                          width: 3,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(224, 43, 87, 1),
                          width: 3,
                        ),
                      ),
                      hintText:
                          '${widget.criptoViewData.symbol.toUpperCase()} 0.00',
                      hintStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,6}')),
                    ],
                    onChanged: (value) {
                      if (key.currentState!.validate()) {
                        setState(() {
                          formatLatestValue();
                          getTotal(singleCripto);
                        });
                      }
                    },
                    validator: (value) {
                      if (value == '' || value == null) {
                      } else if (double.parse(
                              formattingValue(value.toString())) >
                          argument.criptoConversion) {
                        return 'Saldo insuficiente';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    formatLatestValue(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.32),
                  const Divider(thickness: 1),
                  Text(
                    'Total estimado',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 17),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${getTotal(singleCripto)} ${convertedCripto.state.symbol.toUpperCase()}',
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            floatingActionButton: const ConversionFloatingActionButton(),
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
