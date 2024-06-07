import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rto_application/Model/exam_question_list.dart';
import 'package:rto_application/Model/image_model.dart';
import 'package:rto_application/Utils/text.dart';
import 'package:http/http.dart' as http;

class QuestionBank extends StatefulWidget {
  const QuestionBank({super.key});

  @override
  State<QuestionBank> createState() => _QuestionBankState();
}

class _QuestionBankState extends State<QuestionBank> {
  final List<ExamModel> questions = [];
  final List<ImageModel> images = [];

  Future<List<ExamModel>> fetchQuestions() async {
    final response = await http.get(
        Uri.parse('http://mapi.trycatchtech.com/v1/rto/text_question_list'));
    var questionData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in questionData) {
        questions.add(ExamModel.fromJson(i));
      }

      return questions;
    } else {
      return questions;
    }
  }

  Future<List<ImageModel>> fetchImages() async {
    final responseData = await http.get(
        Uri.parse("http://mapi.trycatchtech.com/v1/rto/image_question_list"));
    var imagesData = jsonDecode(responseData.body.toString());
    if (responseData.statusCode == 200) {
      for (Map<String, dynamic> imagesList in imagesData) {
        images.add(ImageModel.fromJson(imagesList));
      }

      return images;
    } else {
      return images;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchQuestions();
    fetchImages();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: textYellow("QuestionBank"),
            backgroundColor: const Color.fromARGB(255, 255, 105, 5),
            bottom: const TabBar(tabs: [
              Tab(
                text: "QUESTIONS",
              ),
              Tab(
                text: "TRAFFIC SIGNS",
              )
            ]),
          ),
          backgroundColor: Colors.yellow,
          body: TabBarView(
            children: [
              Builder(builder: (context) {
                return ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          questions[index].question.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 25),
                        ),
                        subtitle: Text(
                          questions[index].answer.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
              ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      shape: const BeveledRectangleBorder(),
                      child: ListTile(
                        leading: Image.network(
                          images[index].image.toString(),
                          scale: 1.0,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            images[index].name.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
