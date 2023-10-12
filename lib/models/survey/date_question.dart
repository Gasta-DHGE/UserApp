import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class DateQuestion extends Question {
  DateQuestion(
      {required super.id,
      required super.isOptional,
      required super.type,
      required super.title,
      required super.description});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isOptional': isOptional,
      'type': type.toString(),
      'title': title,
      'description': description,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return DateQuestion(
      id: json['id'],
      isOptional: json['isOptional'],
      type: QuestionType.values
          .where((element) => element.toString() == json['type'])
          .first,
      title: json['title'],
      description: json['description'],
    );
  }
}
