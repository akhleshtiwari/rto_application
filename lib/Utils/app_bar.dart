import 'package:flutter/material.dart';

PreferredSizeWidget appBar(String text) {
  return AppBar(
    title: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.yellow,
        ),
      ),
    ),
    backgroundColor: const Color.fromARGB(255, 255, 105, 5),
  );
}
