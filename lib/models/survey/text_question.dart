import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/survey/question.dart';

class TextQuestion extends Question {
  String content;

  TextQuestion({
    required super.id,
    required super.isOptional,
    required super.type,
    required super.title,
    required super.description,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isOptional': isOptional,
      'type': type.toString(),
      'title': title,
      'description': description,
      'content': content,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return TextQuestion(
      id: json['id'],
      isOptional: json['isOptional'],
      type: QuestionType.values
          .where((element) => element.toString() == json['type'])
          .first,
      title: json['title'],
      description: json['description'],
      content: json['content'],
    );
  }
}
