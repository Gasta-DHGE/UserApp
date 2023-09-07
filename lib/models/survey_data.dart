import 'package:gasta_user_app/models/survey.dart';
import 'package:gasta_user_app/models/survey_answer.dart';

class SurveyData {
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
}
