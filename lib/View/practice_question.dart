import 'package:flutter/material.dart';

class PracticeQuestion extends StatelessWidget {
  const PracticeQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Practice",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 105, 5),
      ),
      backgroundColor: Colors.yellow,
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => const Column(
          children: [
            Card(
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
                    Text(
                      "all optional answer",
                    ),
                    Text("all optional answer"),
                    Text("all optional answer")
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
