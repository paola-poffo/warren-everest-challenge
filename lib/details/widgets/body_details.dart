import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/asset.dart';
import 'graphic.dart';

class BodyDetails extends StatelessWidget {
  const BodyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Bitcoin',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(btc),
                ),
              ],
            ),
            const Text(
              'BTC',
              style: TextStyle(
                color: Color.fromRGBO(117, 118, 128, 1),
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              NumberFormat.simpleCurrency(locale: 'pt-BR').format(
                double.parse('100000'),
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
            const Graphic(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  minWidth: 2,
                  onPressed: () {},
                  color: const Color.fromARGB(156, 180, 181, 193),
                  child: const Text(
                    '5D',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: 2,
                  onPressed: () {},
                  color: Colors.white,
                  child: const Text(
                    '15D',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: 2,
                  onPressed: () {},
                  color: Colors.white,
                  child: const Text(
                    '30D',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: 10,
                  onPressed: () {},
                  color: Colors.white,
                  child: const Text(
                    '45D',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: 5,
                  onPressed: () {},
                  color: Colors.white,
                  child: const Text(
                    '90D',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Preço atual',
                  style: TextStyle(
                      fontSize: 19, color: Color.fromRGBO(117, 118, 128, 1)),
                ),
                Text(
                  'valor',
                  style: TextStyle(
                      fontSize: 19, color: Color.fromRGBO(117, 118, 128, 1)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(thickness: 1),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Variação 24H',
                  style: TextStyle(
                      fontSize: 19, color: Color.fromRGBO(117, 118, 128, 1)),
                ),
                Text(
                  '-0,50%',
                  style: TextStyle(
                      fontSize: 19, color: Color.fromRGBO(117, 118, 128, 1)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(thickness: 1),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Quantidade',
                  style: TextStyle(
                      fontSize: 19, color: Color.fromRGBO(117, 118, 128, 1)),
                ),
                Text(
                  '0,65554321 BTC',
                  style: TextStyle(
                      fontSize: 19, color: Color.fromRGBO(117, 118, 128, 1)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(thickness: 1),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Valor',
                  style: TextStyle(
                      fontSize: 19, color: Color.fromRGBO(117, 118, 128, 1)),
                ),
                Text(
                  'R 6.557,00',
                  style: TextStyle(
                      fontSize: 19, color: Color.fromRGBO(117, 118, 128, 1)),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Align(
              child: MaterialButton(
                padding: const EdgeInsets.only(left: 115, right: 115),
                height: 60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: const Color.fromRGBO(224, 43, 87, 1),
                onPressed: () {},
                child: const Text(
                  'Converter Moeda',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
