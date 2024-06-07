import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rto_application/Model/exam_practice_model.dart';
import 'package:rto_application/Utils/app_bar.dart';
import 'package:rto_application/Utils/custom_radio.dart';
import 'package:http/http.dart' as http;

class PracticeQuestion extends StatefulWidget {
  const PracticeQuestion({super.key});

  @override
  State<PracticeQuestion> createState() => _PracticeQuestionState();
}

class _PracticeQuestionState extends State<PracticeQuestion> {
  // ignore: non_constant_identifier_names
  final List<PracticeModel> practice_list = [];

  Future<List<PracticeModel>> fetchPractice() async {
    final practiceData = await http.get(Uri.parse(
        "http://mapi.trycatchtech.com/v1/rto/practice_question_list"));
    var practiceDatas = jsonDecode(practiceData.body.toString());
    if (practiceData.statusCode == 200) {
      for (Map<String, dynamic> prData in practiceDatas) {
        practice_list.add(PracticeModel.fromJson(prData));
      }
      return practice_list;
    } else {
      return practice_list;
    }
  }

  @override
  void initState() {
    fetchPractice();
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar("Practice"),
        backgroundColor: Colors.yellow,
        body: ListView.builder(
          itemCount: practice_list.length,
          itemBuilder: (context, index) => Column(
            children: [
              Card(
                child: ListTile(
                  title: Center(
                    child: Text(
                      practice_list[index].question.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Column(
                    children: [
                      customRadio(practice_list[index].option1.toString()),
                      customRadio(practice_list[index].option2.toString()),
                      customRadio(practice_list[index].option3.toString()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
