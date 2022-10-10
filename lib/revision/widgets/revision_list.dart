import 'package:flutter/material.dart';


class RevisionList extends StatelessWidget {
  final String title;
  final String data;

  const RevisionList({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 19,
        ),
      ),
      trailing: Text(
        data,
        style: const TextStyle(
          fontSize: 19,
        ),
      ),
      contentPadding: EdgeInsets.zero,
      shape: const Border(
        top: BorderSide(
          color: Color.fromRGBO(227, 228, 235, 1),
        ),
      ),
    );
  }
}
