import 'package:gasta_core/gasta_core.dart';

import '../models.dart';

class SingleSelectQuestionAnswer extends QuestionAnswer {
  String selectedAnswerString = '';

  SingleSelectQuestionAnswer(
      {required super.id,
      required super.type,
      required this.selectedAnswerString});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'selectedAnswerString': selectedAnswerString,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return SingleSelectQuestionAnswer(
      id: json['id'],
      type: QuestionType.values
          .where((element) => element.name == json['type'])
          .first,
      selectedAnswerString: json['selectedAnswerString'],
    );
  }
}
