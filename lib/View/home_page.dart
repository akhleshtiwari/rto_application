import 'package:flutter/material.dart';
import 'package:rto_application/Utils/app_bar.dart';
import 'package:rto_application/Utils/custom_card.dart';
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
        appBar: appBar("RTO EXAM"),
        body: ListView(
          children: [
            customCard(
                context,
                const Icon(Icons.note),
                "Question Bank",
                "List of Question and Answer and meaning of road signs",
                const QuestionBank()),
            customCard(
                context,
                const Icon(Icons.book),
                "Practice",
                "Test your knowledge and prepare for the exam",
                const PracticeQuestion()),
            customCard(
                context,
                const Icon(Icons.note_add_outlined),
                "Exam",
                "Start Your Test and show your knowledge",
                const QuestionScreen())
          ],
        ),
      ),
    );
  }
}
