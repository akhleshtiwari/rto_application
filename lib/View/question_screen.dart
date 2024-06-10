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
  final List<PracticeModel> practiceLists = [];
  late PageController _pageController;
  int _currentIndex = 0;

  Future<List<PracticeModel>> fetchPractice() async {
    final practiceData = await http.get(Uri.parse(
        "http://mapi.trycatchtech.com/v1/rto/practice_question_list"));
    var practiceDatas = jsonDecode(practiceData.body.toString());
    if (practiceData.statusCode == 200) {
      for (Map<String, dynamic> prData in practiceDatas) {
        practiceLists.add(PracticeModel.fromJson(prData));
      }
      return practiceLists;
    } else {
      return practiceLists;
    }
  }

  @override
  void initState() {
    fetchPractice();
    super.initState();
    _pageController = PageController();
    fetchD();
  }

  Future<void> fetchD() async {
    await fetchPractice();

    setState(() {});
  }

  void _nextPage() {
    if (_currentIndex < practiceLists.length - 1) {
      _currentIndex++;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: appBar("RTO EXAM"),
      body: practiceLists.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: practiceLists.length,
                    itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.fromLTRB(15, 50, 15, 300),
                      child: ListTile(
                        title: Column(
                          children: [
                            Text(
                              practiceLists[index].question.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            customRadio(
                                practiceLists[index].option1.toString()),
                            customRadio(
                                practiceLists[index].option2.toString()),
                            customRadio(
                                practiceLists[index].option3.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      Color.fromARGB(255, 1, 107, 1),
                    ),
                  ),
                  child: const Text(
                    "NEXT",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
    );
  }
}
