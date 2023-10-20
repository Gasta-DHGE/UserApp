import 'package:equatable/equatable.dart';
import 'package:gasta_core/gasta_core.dart';

abstract class QuestionAnswer extends Equatable {
  final String id;
  final QuestionType type;

  const QuestionAnswer({required this.id, required this.type});

  QuestionAnswer copyWith({
    String? id,
    QuestionType? type,
  });
}
