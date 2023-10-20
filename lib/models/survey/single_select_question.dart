import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/survey/question.dart';

// ignore: must_be_immutable
class SingleSelectQuestion extends Question {
  List<String> options;

  SingleSelectQuestion({
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
      'type': type.name,
      'title': title,
      'description': description,
      'options': options,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return SingleSelectQuestion(
      id: json['id'],
      isOptional: json['isOptional'],
      type: QuestionType.values
          .where((element) => element.name == json['type'])
          .first,
      title: json['title'],
      description: json['description'],
      options:
          (json['options'] as List<dynamic>).map((e) => e.toString()).toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        isOptional,
        type,
        title,
        description,
      ];
}
