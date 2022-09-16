import 'package:flutter/material.dart';

class Graphic extends StatefulWidget {
  const Graphic({Key? key}) : super(key: key);

  @override
  State<Graphic> createState() => _GraphicState();
}

class _GraphicState extends State<Graphic> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 200,
        width: 400,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
      ),
    );
  }
}
