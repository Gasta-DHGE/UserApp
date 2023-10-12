import 'package:gasta_core/gasta_core.dart';

import '../models.dart';

class MultiSelectQuestionAnswer extends QuestionAnswer {
  List<String> selectedAnswerStrings = [];

  MultiSelectQuestionAnswer(
      {required super.id,
      required super.type,
      required this.selectedAnswerStrings});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toString(),
      'selectedAnswerStrings': selectedAnswerStrings,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return MultiSelectQuestionAnswer(
      id: json['id'],
      type: QuestionType.values
          .where((element) => element.toString() == json['type'])
          .first,
      selectedAnswerStrings: json['selectedAnswerStrings'],
    );
  }
}
