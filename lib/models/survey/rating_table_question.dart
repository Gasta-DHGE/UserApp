import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class RatingTableQuestion extends Question {
  List<String> ratingHeaders;
  List<String> ratingQuestions;

  RatingTableQuestion(
      {required super.id,
      required super.isOptional,
      required super.type,
      required super.title,
      required super.description,
      required this.ratingHeaders,
      required this.ratingQuestions});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isOptional': isOptional,
      'type': type.name,
      'title': title,
      'description': description,
      'ratingHeaders': ratingHeaders,
      'ratingQuestions': ratingQuestions,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return RatingTableQuestion(
      id: json['id'],
      isOptional: json['isOptional'],
      type: QuestionType.values
          .where((element) => element.name == json['type'])
          .first,
      title: json['title'],
      description: json['description'],
      ratingHeaders: (json['ratingHeaders'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      ratingQuestions: (json['ratingQuestions'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
    );
  }
}
