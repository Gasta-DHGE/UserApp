import 'package:equatable/equatable.dart';
import 'package:gasta_core/gasta_core.dart';

// ignore: must_be_immutable
abstract class Question extends Equatable {
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
