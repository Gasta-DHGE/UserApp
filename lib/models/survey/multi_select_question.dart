import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/survey/question.dart';

class MultiSelectQuestion extends Question {
  final List<String> options;

  const MultiSelectQuestion({
    required super.id,
    required super.isOptional,
    required super.type,
    required super.title,
    required super.description,
    required this.options,
  });

  @override
  MultiSelectQuestion copyWith({
    String? id,
    bool? isOptional,
    QuestionType? type,
    String? title,
    String? description,
    List<String>? options,
  }) {
    return MultiSelectQuestion(
      id: id ?? this.id,
      isOptional: isOptional ?? this.isOptional,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isOptional': isOptional,
      'type': type.name,
      'title': title,
      'description': description,
      'options': options,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return MultiSelectQuestion(
      id: json['id'],
      isOptional: json['isOptional'],
      type: QuestionType.values
          .where((element) => element.name == json['type'])
          .first,
      title: json['title'],
      description: json['description'],
      options:
          (json['options'] as List<dynamic>).map((e) => e.toString()).toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        isOptional,
        type,
        title,
        description,
        options,
      ];
}
