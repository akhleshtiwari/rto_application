class PracticeModel {
  String? id;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? answer;

  PracticeModel(
      {required this.id,
      required this.question,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.answer});

  PracticeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    option1 = json['option_1'];
    option2 = json['option_2'];
    option3 = json['option_3'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['option_1'] = option1;
    data['option_2'] = option2;
    data['option_3'] = option3;
    data['answer'] = answer;
    return data;
  }
}
