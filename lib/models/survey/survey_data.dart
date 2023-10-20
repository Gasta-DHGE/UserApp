import 'package:equatable/equatable.dart';
import 'package:gasta_user_app/models/survey/survey.dart';
import 'package:gasta_user_app/models/survey/survey_answer.dart';

// ignore: must_be_immutable
class SurveyData extends Equatable {
  Survey survey;
  SurveyAnswer answer;

  SurveyData({required this.survey, required this.answer});

  static SurveyData fromJson(Map<String, dynamic> json) {
    return SurveyData(
      survey: Survey.fromJson(json['survey']),
      answer: SurveyAnswer.fromJson(json['answer']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'survey': survey.toJson(),
      'answer': answer.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        survey,
        answer,
      ];
}
