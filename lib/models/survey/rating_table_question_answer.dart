import 'package:equatable/equatable.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class RatingTableQuestionAnswer extends QuestionAnswer {
  final List<RatingAnswer> ratingAnswers;

  const RatingTableQuestionAnswer(
      {required super.id, required super.type, required this.ratingAnswers});

  @override
  RatingTableQuestionAnswer copyWith({
    String? id,
    QuestionType? type,
    List<RatingAnswer>? ratingAnswers,
  }) {
    return RatingTableQuestionAnswer(
      id: id ?? this.id,
      type: type ?? this.type,
      ratingAnswers: ratingAnswers ?? this.ratingAnswers,
    );
  }

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

  @override
  List<Object?> get props => [
        id,
        type,
        ratingAnswers,
      ];
}

// ignore: must_be_immutable
class RatingAnswer extends Equatable {
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

  @override
  List<Object?> get props => [
        ratingQuestion,
        rating,
      ];
}
