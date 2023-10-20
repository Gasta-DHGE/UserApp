import 'package:equatable/equatable.dart';
import 'package:gasta_core/gasta_core.dart';

abstract class Question extends Equatable {
  final String id;
  final bool isOptional;
  final QuestionType type;
  final String title;
  final String description;

  const Question({
    required this.id,
    required this.isOptional,
    required this.type,
    required this.title,
    required this.description,
  });

  Question copyWith({
    String? id,
    bool? isOptional,
    QuestionType? type,
    String? title,
    String? description,
  });
}
