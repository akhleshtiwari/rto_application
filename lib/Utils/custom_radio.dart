import 'package:flutter/material.dart';

Widget customRadio(String answer) {
  return RadioListTile(
    contentPadding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
    title: Text(
      answer,
      style: const TextStyle(
        fontSize: 14,
      ),
    ),
    fillColor: const MaterialStatePropertyAll(
      Color.fromARGB(255, 4, 90, 7),
    ),
    value: 1,
    groupValue: const [],
    onChanged: (value) {},
  );
}
