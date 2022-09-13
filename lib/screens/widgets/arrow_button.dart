import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_forward_ios_rounded),
      onPressed: () {},
      color: const Color.fromRGBO(117, 118, 128, 1),
      iconSize: 18,
    );
  }
}
