import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class RatingTableQuestionAnswer extends QuestionAnswer {
  List<RatingAnswer> ratingAnswers;

  RatingTableQuestionAnswer(
      {required super.id, required super.type, required this.ratingAnswers});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'ratingAnswers': ratingAnswers.map((e) => e.toJson()).toList(),
    };
  }

  static fromJson(Map<String, dynamic> json) {
    List<RatingAnswer> answers = [];
    for (var map in json['ratingAnswers']) {
      answers.add(RatingAnswer.fromJson(map));
    }

    return RatingTableQuestionAnswer(
      id: json['id'],
      type: QuestionType.values
          .where((element) => element.name == json['type'])
          .first,
      ratingAnswers: answers,
    );
  }
}

class RatingAnswer {
  String ratingQuestion;
  String rating;

  RatingAnswer({required this.ratingQuestion, required this.rating});

  Map<String, dynamic> toJson() {
    return {
      'ratingQuestion': ratingQuestion,
      'rating': rating,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return RatingAnswer(
        ratingQuestion: json['ratingQuestion'], rating: json['rating']);
  }
}
