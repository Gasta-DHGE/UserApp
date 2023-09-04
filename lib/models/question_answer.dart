import 'package:gasta_core/gasta_core.dart';

class QuestionAnswer {
  String id;
  QuestionType type;
  List<dynamic> content;

  QuestionAnswer({required this.id, required this.type, required this.content});
}
