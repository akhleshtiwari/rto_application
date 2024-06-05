import 'package:flutter/material.dart';

Widget customCard(BuildContext context, Widget icons, String cardT,
    String cardSt, Widget screen) {
  return Card(
    shape: const BeveledRectangleBorder(),
    child: ListTile(
      leading: icons,
      title: Text(cardT),
      subtitle: Text(cardSt),
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
