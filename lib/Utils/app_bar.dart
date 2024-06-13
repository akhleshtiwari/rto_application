import 'package:flutter/material.dart';

PreferredSizeWidget appBar(String text) {
  return AppBar(
    flexibleSpace: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    ),
    backgroundColor: const Color.fromARGB(255, 209, 53, 53),
  );
}
