import 'package:gasta_core/gasta_core.dart';

import '../models.dart';

class TextQuestionAnswer extends QuestionAnswer {
  final String answer;

  const TextQuestionAnswer(
      {required super.id, required super.type, required this.answer});

  @override
  TextQuestionAnswer copyWith({
    String? id,
    QuestionType? type,
    String? answer,
  }) {
    return TextQuestionAnswer(
      id: id ?? this.id,
      type: type ?? this.type,
      answer: answer ?? this.answer,
    );
  }

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

  @override
  List<Object?> get props => [
        id,
        type,
        answer,
      ];
}
