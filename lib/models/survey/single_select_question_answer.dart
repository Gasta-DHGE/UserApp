import 'package:gasta_core/gasta_core.dart';

import '../models.dart';

class SingleSelectQuestionAnswer extends QuestionAnswer {
  final String selectedAnswerString;

  const SingleSelectQuestionAnswer(
      {required super.id,
      required super.type,
      required this.selectedAnswerString});

  @override
  SingleSelectQuestionAnswer copyWith({
    String? id,
    QuestionType? type,
    String? selectedAnswerString,
  }) {
    return SingleSelectQuestionAnswer(
      id: id ?? this.id,
      type: type ?? this.type,
      selectedAnswerString: selectedAnswerString ?? this.selectedAnswerString,
    );
  }

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

  @override
  List<Object?> get props => [
        id,
        type,
        selectedAnswerString,
      ];
}
