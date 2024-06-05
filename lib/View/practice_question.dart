import 'package:flutter/material.dart';
import 'package:rto_application/Utils/app_bar.dart';
import 'package:rto_application/Utils/custom_radio.dart';

class PracticeQuestion extends StatelessWidget {
  const PracticeQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Practice"),
      backgroundColor: Colors.yellow,
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Column(
          children: [
            const Card(
              child: ListTile(
                title: Center(
                  child: Text(
                    "all Questions",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Column(
                  children: [
                    customRadio("1st answer"),
                    customRadio("2nd answer"),
                    customRadio("3rd answer"),
                    customRadio("4th answer"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
