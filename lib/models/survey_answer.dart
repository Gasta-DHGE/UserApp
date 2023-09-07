import 'models.dart';

class SurveyAnswer {
  final String id;
  final int version;
  final List<QuestionAnswer> answers;

  SurveyAnswer({
    required this.id,
    required this.answers,
    required this.version,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> answerMaps = [];
    for (var answer in answers) {
      answerMaps.add(answer.toJson());
    }

    return {
      'id': id,
      'version': version,
      'answers': answerMaps,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    List<QuestionAnswer> answers = [];
    var answerMaps = json['answers'];
    for (var map in answerMaps) {
      answers.add(QuestionAnswer.fromJson(map));
    }

    return SurveyAnswer(
      id: json['id'],
      version: json['version'],
      answers: answers,
    );
  }
}
