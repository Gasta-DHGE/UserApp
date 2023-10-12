import 'package:gasta_core/gasta_core.dart';

abstract class QuestionAnswer {
  String id;
  QuestionType type;

  QuestionAnswer({required this.id, required this.type});
}
