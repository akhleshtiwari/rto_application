class ExamModel {
  String? id;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? answer;

  ExamModel(
      {this.id,
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.answer});

  ExamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    option1 = json['option_1'];
    option2 = json['option_2'];
    option3 = json['option_3'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['option_1'] = this.option1;
    data['option_2'] = this.option2;
    data['option_3'] = this.option3;
    data['answer'] = this.answer;
    return data;
  }
}
