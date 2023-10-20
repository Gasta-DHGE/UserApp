import 'package:equatable/equatable.dart';
import 'package:gasta_core/gasta_core.dart';

// ignore: must_be_immutable
abstract class QuestionAnswer extends Equatable {
  String id;
  QuestionType type;

  QuestionAnswer({required this.id, required this.type});
}
