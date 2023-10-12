import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class NumberRatingQuestion extends Question {
  int minRating;
  int maxRating;

  NumberRatingQuestion(
      {required super.id,
      required super.isOptional,
      required super.type,
      required super.title,
      required super.description,
      required this.minRating,
      required this.maxRating});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isOptional': isOptional,
      'type': type.toString(),
      'title': title,
      'description': description,
      'minRating': minRating,
      'maxRating': maxRating,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return NumberRatingQuestion(
        id: json['id'],
        isOptional: json['isOptional'],
        type: QuestionType.values
            .where((element) => element.toString() == json['type'])
            .first,
        title: json['title'],
        description: json['description'],
        minRating: json['minRating'],
        maxRating: json['maxRating']);
  }
}
