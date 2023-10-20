import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class DateQuestion extends Question {
  const DateQuestion(
      {required super.id,
      required super.isOptional,
      required super.type,
      required super.title,
      required super.description});

  @override
  DateQuestion copyWith({
    String? id,
    bool? isOptional,
    QuestionType? type,
    String? title,
    String? description,
  }) {
    return DateQuestion(
      id: id ?? this.id,
      isOptional: isOptional ?? this.isOptional,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isOptional': isOptional,
      'type': type.name,
      'title': title,
      'description': description,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return DateQuestion(
      id: json['id'],
      isOptional: json['isOptional'],
      type: QuestionType.values
          .where((element) => element.name == json['type'])
          .first,
      title: json['title'],
      description: json['description'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        isOptional,
        type,
        title,
        description,
      ];
}
