import 'package:gasta_core/gasta_core.dart';

import '../models.dart';

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
      switch (answer.runtimeType) {
        case TextQuestionAnswer:
          answerMaps.add((answer as TextQuestionAnswer).toJson());
          break;
        case SingleSelectQuestionAnswer:
          answerMaps.add((answer as SingleSelectQuestionAnswer).toJson());
          break;
        case MultiSelectQuestionAnswer:
          answerMaps.add((answer as MultiSelectQuestionAnswer).toJson());
          break;
      }
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
      switch (map['type']) {
        case QuestionType.text:
          answers.add(TextQuestionAnswer.fromJson(map));
          break;
        case QuestionType.select:
          answers.add(SingleSelectQuestionAnswer.fromJson(map));
          break;
        case QuestionType.multiSelect:
          answers.add(MultiSelectQuestionAnswer.fromJson(map));
          break;
      }
    }

    return SurveyAnswer(
      id: json['id'],
      version: json['version'],
      answers: answers,
    );
  }
}
