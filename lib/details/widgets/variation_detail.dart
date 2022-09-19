import 'package:flutter/material.dart';

class VariationDetail extends StatelessWidget {
  final String title;
  final dynamic number;
  final Color? color;
  final bool isVariation;

  const VariationDetail({
    Key? key,
    required this.title,
    required this.number,
    this.color = Colors.black,
    this.isVariation = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade500,
            ),
          ),
          Text(
            number,
            style: TextStyle(
              fontSize: 18,
              color: color,
              fontWeight: isVariation ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
