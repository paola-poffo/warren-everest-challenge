import 'package:flutter/material.dart';

class ConfirmedScreenBody extends StatelessWidget {
  const ConfirmedScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 214, 255, 223)),
            child: const Icon(
              Icons.done,
              size: 40,
              color: Color.fromARGB(255, 104, 167, 125),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Conversão efetuada',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Conversão de moeda efetuada com sucesso!',
            style: TextStyle(
              fontSize: 17,
              color: Color.fromRGBO(117, 118, 128, 1),
            ),
          ),
        ],
      ),
    );
  }
}
