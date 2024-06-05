import 'package:flutter/material.dart';
import 'package:rto_application/Utils/text.dart';
import 'package:rto_application/View/practice_question.dart';
import 'package:rto_application/View/question_bank.dart';
import 'package:rto_application/View/question_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Center(
            child: textYellow("RTO EXAM",),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 105, 5),
        ),
        body: ListView(
          children: [
            Card(
              shape: const BeveledRectangleBorder(),
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuestionBank()));
                },
                leading: const Icon(Icons.question_answer),
                title: const Text("Question Bank"),
                subtitle: const Text(
                    "List of Question and Answer and meaning of road signs. "),
              ),
            ),
            Card(
              shape: const BeveledRectangleBorder(),
              child: ListTile(
                leading: const Icon(Icons.note),
                title: const Text("Practice"),
                subtitle:
                    const Text("Test your Knowledge and prepare for the exam."),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PracticeQuestion(),
                    ),
                  );
                },
              ),
            ),
            Card(
              shape: const BeveledRectangleBorder(),
              child: ListTile(
                leading: const Icon(Icons.note_add),
                title: const Text("Practice"),
                subtitle:
                    const Text("Start your Test and show your knowledge."),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuestionScreen(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
