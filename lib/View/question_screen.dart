import 'package:flutter/material.dart';
import 'package:rto_application/Model/exam_practice_model.dart';
import 'package:rto_application/Utils/app_bar.dart';
import 'package:rto_application/Utils/custom_radio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
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
    return Scaffold(
      floatingActionButton: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "NEXT",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green)),
        ),
      ),
      backgroundColor: Colors.yellow,
      appBar: appBar("RTO EXAM"),
      body: ListView.builder(
        itemCount: practice_list.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Column(
              children: [
                Text(
                  practice_list[index].question.toString(),
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                ),
                customRadio("option 1"),
                customRadio("option 2"),
                customRadio("option 3"),
                const SizedBox(
                  height: 10,
                ),
                const Text(
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
