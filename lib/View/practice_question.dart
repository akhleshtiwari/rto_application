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
  final List<PracticeModel> practiceList = [];
  late PageController _pageController;

  Future<List<PracticeModel>> fetchPractice() async {
    final practiceData = await http.get(Uri.parse(
        "http://mapi.trycatchtech.com/v1/rto/practice_question_list"));
    var practiceDatas = jsonDecode(practiceData.body.toString());
    if (practiceData.statusCode == 200) {
      for (Map<String, dynamic> prData in practiceDatas) {
        practiceList.add(PracticeModel.fromJson(prData));
      }
      return practiceList;
    } else {
      return practiceList;
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    fetchPracticeData();
  }

  Future<void> fetchPracticeData() async {
    await fetchPractice();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar("Practice"),
        backgroundColor: Colors.yellow,
        body: practiceList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: practiceList.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              title: Center(
                                child: Text(
                                  practiceList[index].question.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              title: Column(
                                children: [
                                  customRadio(
                                      practiceList[index].option1.toString()),
                                  customRadio(
                                      practiceList[index].option2.toString()),
                                  customRadio(
                                      practiceList[index].option3.toString()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 200),
                    child: Text(
                      "Swipe Right To Next",
                      style: TextStyle(
                        color: Color.fromARGB(255, 4, 90, 7),
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
