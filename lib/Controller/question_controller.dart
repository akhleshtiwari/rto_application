// import 'dart:convert';

// import '../Model/exam_question_list.dart';

// class QuestionController {
//  List<ExamModel> questions=[];

//   Future<List<ExamModel>> fetchQuestions() async {
//     final response = await http.get(Uri.parse(
//         'http://mapi.trycatchtech.com/v1/rto/practice_question_list'));
//     var questionData = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       for (Map<String, dynamic> i in questionData) {
//         questions.add(ExamModel.fromJson(i));
//       }
//       return questions;
//     } else {
//       return questions = [];
//     }
//   }
// }