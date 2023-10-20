import 'package:equatable/equatable.dart';
import 'package:gasta_core/gasta_core.dart';

import '../models.dart';

class SurveyAnswer extends Equatable {
  final String id;
  final int version;
  final int rewardChoiceIndex;
  final List<QuestionAnswer> answers;

  const SurveyAnswer({
    required this.id,
    required this.version,
    required this.rewardChoiceIndex,
    required this.answers,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> answerMaps = [];
    for (var answer in answers) {
      switch (answer.runtimeType) {
        case TextQuestionAnswer:
          answerMaps.add((answer as TextQuestionAnswer).toJson());
          break;
        case SingleSelectQuestionAnswer:
          answerMaps.add((answer as SingleSelectQuestionAnswer).toJson());
          break;
        case MultiSelectQuestionAnswer:
          answerMaps.add((answer as MultiSelectQuestionAnswer).toJson());
          break;
        case NumberRatingQuestionAnswer:
          answerMaps.add((answer as NumberRatingQuestionAnswer).toJson());
          break;
        case RatingTableQuestionAnswer:
          answerMaps.add((answer as RatingTableQuestionAnswer).toJson());
          break;
        case DateQuestionAnswer:
          answerMaps.add((answer as DateQuestionAnswer).toJson());
          break;
        case TimeQuestionAnswer:
          answerMaps.add((answer as TimeQuestionAnswer).toJson());
          break;
        case DateAndTimeQuestionAnswer:
          answerMaps.add((answer as DateAndTimeQuestionAnswer).toJson());
          break;
      }
    }

    return {
      'id': id,
      'version': version,
      'rewardChoiceIndex': rewardChoiceIndex,
      'answers': answerMaps,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    List<QuestionAnswer> answers = [];
    var answerMaps = json['answers'];
    for (var map in answerMaps) {
      switch (QuestionType.values
          .firstWhere((element) => element.name == map['type'])) {
        case QuestionType.text:
          answers.add(TextQuestionAnswer.fromJson(map));
          break;
        case QuestionType.select:
          answers.add(SingleSelectQuestionAnswer.fromJson(map));
          break;
        case QuestionType.multiSelect:
          answers.add(MultiSelectQuestionAnswer.fromJson(map));
          break;
        case QuestionType.numberRating:
          answers.add(NumberRatingQuestionAnswer.fromJson(map));
          break;
        case QuestionType.ratingTable:
          answers.add(RatingTableQuestionAnswer.fromJson(map));
          break;
        case QuestionType.date:
          answers.add(DateQuestionAnswer.fromJson(map));
          break;
        case QuestionType.time:
          answers.add(TimeQuestionAnswer.fromJson(map));
          break;
        case QuestionType.dateAndTime:
          answers.add(DateAndTimeQuestionAnswer.fromJson(map));
          break;
      }
    }

    return SurveyAnswer(
      id: json['id'],
      version: json['version'],
      rewardChoiceIndex: json['rewardChoiceIndex'],
      answers: answers,
    );
  }

  @override
  List<Object?> get props => [
        id,
        version,
        rewardChoiceIndex,
        answers,
      ];
}
