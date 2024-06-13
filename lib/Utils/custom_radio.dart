import 'package:flutter/material.dart';

Widget customRadio(
  // String option,
  String answer,
// String gValue
) {
  return RadioListTile(
    contentPadding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
    title: Text(
      answer,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
    fillColor: const MaterialStatePropertyAll(
      Color.fromARGB(255, 4, 90, 7),
    ),
    value: answer,
    groupValue: 1,
    onChanged: (value) {
      print(value);
      
    },
  );
}
