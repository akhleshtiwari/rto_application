import 'package:flutter/material.dart';

Widget customCard(BuildContext context, Widget icons, String cardT,
    String cardSt, Widget screen, Color colors) {
  return Card(
    color: colors,
    shape: const BeveledRectangleBorder(),
    child: ListTile(
      leading: icons,
      title: Text(
        cardT,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        cardSt,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
    ),
  );
}
