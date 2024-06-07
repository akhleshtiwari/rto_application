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
  late PageController _pageController;
  int _currentIndex = 0;

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
    _pageController = PageController();
  }

  void _nextPage() {
    if (_currentIndex < practice_list.length - 1) {
      _currentIndex++;
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: appBar("RTO EXAM"),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: practice_list.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Column(
                    children: [
                      Text(
                        practice_list[index].question.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      customRadio(practice_list[index].option1.toString()),
                      customRadio(practice_list[index].option2.toString()),
                      customRadio(practice_list[index].option3.toString()),
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
          ),
          ElevatedButton(onPressed: _nextPage, child: Text("Next"))
        ],
      ),
    );
  }
}
