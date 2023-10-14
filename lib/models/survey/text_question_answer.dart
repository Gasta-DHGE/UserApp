import 'package:gasta_core/gasta_core.dart';

import '../models.dart';

class TextQuestionAnswer extends QuestionAnswer {
  String answer = '';

  TextQuestionAnswer(
      {required super.id, required super.type, required this.answer});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'answer': answer,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return TextQuestionAnswer(
      id: json['id'],
      type: QuestionType.values
          .where((element) => element.name == json['type'])
          .first,
      answer: json['answer'],
    );
  }
}
