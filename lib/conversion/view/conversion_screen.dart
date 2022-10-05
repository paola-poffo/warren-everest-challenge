import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../portfolio/model/criptos_view_data.dart';
import '../../portfolio/providers/cripto_provider.dart';
import '../../shared/utils/arguments.dart';
import '../provider/single_cripto_provider.dart';
import '../widgets/conversion_default_app_bar.dart';
import '../widgets/conversion_drop_down.dart';
import '../widgets/conversion_balance_available.dart';

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
  TextEditingController convertController = TextEditingController();
  final key = GlobalKey<FormState>();
  bool validate = false;

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

  bool isCorrect(String value) {
    return value.startsWith(RegExp(r'[!@#$%^&*().,?":{}|<>]'));
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
    return total.toStringAsFixed(10);
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConversionBalanceAvailable(
                    criptoViewData: argument.criptoViewData,
                    criptoConversion: argument.criptoConversion,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
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
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(117, 118, 128, 1),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(32),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                argument.criptoViewData.image,
                                scale: 13,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                argument.criptoViewData.symbol.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.sync_alt,
                          color: Color.fromRGBO(224, 43, 87, 1),
                          size: 28,
                        ),
                        ConversionDropDown(
                          criptoViewData: convertedCripto.state,
                          onChangedDropdown:
                              (CriptoViewData? convertedCriptos) {
                            convertedCripto.state = convertedCriptos!;
                            convertLatestValue();
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      showCursor: false,
                      controller: convertController,
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
                        hintText: '${singleCripto.symbol.toUpperCase()} 0.00',
                        hintStyle: TextStyle(
                          fontSize: 30,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,6}'),
                        ),
                      ],
                      onChanged: (value) {
                        if (key.currentState!.validate()) validate = true;
                        setState(() {
                          formatLatestValue();
                          getTotal(singleCripto);
                        });
                      },
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'Digite o valor';
                        } else if (isCorrect(value) || value.startsWith('.')) {
                          return "Não são permitidos caracteres especiais";
                        } else if (double.parse(
                                formattingValue(value.toString())) >
                            argument.criptoConversion) {
                          validate = false;
                          return 'Saldo insuficiente';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    child: Text(
                      formatLatestValue(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 3.6),
                  const Divider(thickness: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total estimado',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${getTotal(singleCripto)} ${convertedCripto.state.symbol.toUpperCase()}',
                              style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        FloatingActionButton(
                          backgroundColor: validate
                              ? const Color.fromRGBO(224, 43, 87, 1)
                              : const Color.fromARGB(255, 202, 200, 212),
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              if (singleCripto != singleCripto) {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      height: 100,
                                      child: Center(
                                        child: Text(
                                          'Incompatibilidade de conversão',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                Navigator.of(context).pushNamed(
                                  '/revision',
                                  arguments: Argument(
                                    criptoViewData: argument.criptoViewData,
                                    criptoConversion: argument.criptoConversion,
                                  ),
                                );
                                validate = true;
                              }
                            }
                          },
                          child: const Icon(Icons.navigate_next),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
