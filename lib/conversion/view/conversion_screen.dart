import 'package:flutter/material.dart';
import '../../portfolio/model/criptos_view_data.dart';
import '../../shared/utils/arguments.dart';
import '../widgets/body_conversion.dart';
import '../widgets/default_app_bar_conversion.dart';

class ConversionScreen extends StatelessWidget {
  ConversionScreen({Key? key, required this.criptosViewData}) : super(key: key);

  final CriptoViewData criptosViewData;

  static const route = '/conversion';

  final TextEditingController convertController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppbarConversion(),
        body: BodyConversion(
          criptosViewData: criptosViewData,
          convertController: convertController,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(224, 43, 87, 1),
          onPressed: () {},
          child: const Icon(
            Icons.keyboard_arrow_right,
          ),
        ),
      ),
    );
  }
}
