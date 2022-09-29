// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../portfolio/model/criptos_view_data.dart';

class ConversionBody extends StatelessWidget {
  const ConversionBody({
    Key? key,
    required this.criptoViewData,
    required this.criptoConversion,
    required this.convertController,
  }) : super(key: key);

  final CriptoViewData criptoViewData;
  final double criptoConversion;
  final TextEditingController convertController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Saldo disponível',
                  style: TextStyle(
                    color: Color.fromRGBO(117, 118, 128, 1),
                    fontSize: 18,
                  ),
                ),
                Text(
                  '${(criptoConversion).toStringAsFixed(8)} ${(criptoViewData.symbol).toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(criptoViewData.image),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(criptoViewData.symbol.toUpperCase()),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: Color.fromRGBO(117, 118, 128, 1),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.sync_alt,
                color: Color.fromRGBO(224, 43, 87, 1),
                size: 28,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          Image.network(criptoViewData.image).image,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(criptoViewData.symbol.toUpperCase()),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: Color.fromRGBO(117, 118, 128, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: TextFormField(
              controller: convertController,
              decoration: InputDecoration(
                hintText: '${criptoViewData.symbol.toUpperCase()} 0,00',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                ),
              ),
              keyboardType: TextInputType.number,
              // onChanged: () {},
              // validator: () {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 5,
            ),
            child: Text(
              'R\$ 0,00',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total estimado',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${criptoConversion.toStringAsFixed(5)} ${criptoViewData.symbol.toUpperCase()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      FloatingActionButton(
                        backgroundColor: const Color.fromRGBO(224, 43, 87, 1),
                        onPressed: () {},
                        child: const Icon(
                          Icons.arrow_forward,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
