import 'package:gasta_core/gasta_core.dart';

class Question {
  String id;
  bool isOptional;
  QuestionType type;
  String title;
  String description;
  List<dynamic> content;

  Question({
    required this.id,
    required this.isOptional,
    required this.type,
    required this.title,
    required this.description,
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
    return Question(
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
