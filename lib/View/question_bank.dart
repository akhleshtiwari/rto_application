import 'package:flutter/material.dart';

class QuestionBank extends StatelessWidget {
  const QuestionBank({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QuestionBank"),
        backgroundColor: const Color.fromARGB(255, 255, 105, 5),
        actions: const [TabBar(tabs: [])],
      ),
      backgroundColor: Colors.yellow,
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => const ListTile(
                title: Text("Question"),
              )),
    );
  }
}
