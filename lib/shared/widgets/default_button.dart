import 'package:flutter/material.dart';

import '../utils/arguments.dart';

class DefaultButton extends StatelessWidget {
  Argument argument;
  String route;
  String label;
  DefaultButton({
    Key? key,
    required this.argument,
    required this.route,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: MaterialButton(
        padding: const EdgeInsets.only(left: 115, right: 115),
        height: 60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: const Color.fromRGBO(224, 43, 87, 1),
        onPressed: () {
          Navigator.pushNamed(context, route, arguments: argument);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
