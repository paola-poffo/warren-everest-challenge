import 'package:flutter/material.dart';

class ConversionText extends StatelessWidget {
  const ConversionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
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
    );
  }
}