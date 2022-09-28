import 'package:flutter/material.dart';

import '../../portfolio/model/criptos_view_data.dart';
import '../../shared/utils/currency_formatter.dart';

class BodyConversion extends StatelessWidget {
  const BodyConversion({
    Key? key,
    required this.criptosViewData,
    required this.convertController,
  }) : super(key: key);

  final CriptosViewData criptosViewData;
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
              horizontal: 20,
            ),
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Saldo Disponível',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  FormatCurrency.format(criptosViewData.currentPrice),
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            child: Text(
              'Quanto você gostaria de converter?',
              style: TextStyle(
                fontSize: 25,
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
                      radius: 9,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(criptosViewData.image),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                      ),
                      child: Text(criptosViewData.symbol.toUpperCase()),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.sync_alt,
                color: Color.fromRGBO(224, 43, 87, 1),
                size: 25,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 9,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          Image.network(criptosViewData.image).image,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                      ),
                      child: Text(criptosViewData.symbol.toUpperCase()),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: convertController,
              decoration: InputDecoration(
                hintText: '${criptosViewData.symbol.toUpperCase()} 0,00',
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
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              'R\$ 10000',
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
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total estimado',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '0,0000 ${criptosViewData.symbol.toUpperCase()}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
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
