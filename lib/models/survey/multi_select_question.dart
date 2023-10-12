import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/survey/question.dart';

class MultiSelectQuestion extends Question {
  List<String> options;

  MultiSelectQuestion({
    required super.id,
    required super.isOptional,
    required super.type,
    required super.title,
    required super.description,
    required this.options,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isOptional': isOptional,
      'type': type.toString(),
      'title': title,
      'description': description,
      'options': options,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return MultiSelectQuestion(
      id: json['id'],
      isOptional: json['isOptional'],
      type: QuestionType.values
          .where((element) => element.toString() == json['type'])
          .first,
      title: json['title'],
      description: json['description'],
      options: json['options'],
    );
  }
}
