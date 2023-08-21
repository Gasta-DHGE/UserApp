import 'package:gasta_core/gasta_core.dart';

class Question {
  bool isOptional;
  QuestionType type;
  String title;
  String description;
  Map<String, dynamic> content;

  Question({
    required this.isOptional,
    required this.type,
    required this.title,
    required this.description,
    required this.content,
  });
}
