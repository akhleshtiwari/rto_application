import 'package:flutter/material.dart';
import 'package:rto_application/Model/exam_question_list.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "RTO EXAM",
            style: TextStyle(
              color: Colors.yellow,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 105, 5),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => const Card(
          child: ListTile(
            title: Column(
              children: [
                Text(
                  "all question",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Correct Answer",
                  style: TextStyle(color: Colors.green),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your Answer",
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
