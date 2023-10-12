import 'package:gasta_core/gasta_core.dart';

abstract class Question {
  String id;
  bool isOptional;
  QuestionType type;
  String title;
  String description;

  Question({
    required this.id,
    required this.isOptional,
    required this.type,
    required this.title,
    required this.description,
  });
}
