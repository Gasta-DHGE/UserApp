import 'package:gasta_core/gasta_core.dart';

import '../models.dart';

// ignore: must_be_immutable
class MultiSelectQuestionAnswer extends QuestionAnswer {
  List<String> selectedAnswerStrings = [];

  MultiSelectQuestionAnswer(
      {required super.id,
      required super.type,
      required this.selectedAnswerStrings});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'selectedAnswerStrings': selectedAnswerStrings,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return MultiSelectQuestionAnswer(
      id: json['id'],
      type: QuestionType.values
          .where((element) => element.name == json['type'])
          .first,
      selectedAnswerStrings: (json['selectedAnswerStrings'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        type,
        selectedAnswerStrings,
      ];
}
