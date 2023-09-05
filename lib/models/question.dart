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
}
