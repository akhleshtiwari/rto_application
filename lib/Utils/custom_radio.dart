import 'package:flutter/material.dart';

Widget customRadio(String answer) {
  return RadioListTile(
    title: Text(
      answer,
    ),
    value: 1,
    groupValue: [],
    onChanged: (value) {},
  );
}
