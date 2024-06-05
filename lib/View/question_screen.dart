import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rto_application/Model/exam_question_list.dart';
import 'package:rto_application/Utils/app_bar.dart';
import 'package:http/http.dart' as http;

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final List<ExamModel> _examList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: appBar("RTO EXAM"),
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
