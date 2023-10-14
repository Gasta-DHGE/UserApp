import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/services/i_authentication_service.dart';
import 'package:gasta_user_app/services/i_save_service.dart';

import '../models/models.dart';
import '../services/i_survey_service.dart';

class ScannerPageController {
  IAuthenticationService authenticationService;
  ISurveyService surveyService;
  ISaveService saveService;

  ScannerPageController(
      {required this.authenticationService,
      required this.surveyService,
      required this.saveService});

  Survey? survey;
  late core.SurveyAnswerEntity surveyAnswer;
  bool surveyLoaded = false;
  var isLoading = ValueNotifier<bool>(false);

  Future<bool> onDataReceivedAsync(String data) async {
    try {
      survey = await surveyService.getSurveyByIdAsync(
          authenticationService.firebaseUser.uid, data);
    } catch (e) {
      survey = null;
    }

    if (survey == null) return false;

    surveyAnswer = core.SurveyAnswerEntity(
      id: survey != null ? survey!.id : "",
      version: survey != null ? survey!.version : 0,
      rewardChoiceIndex: 0,
      answers: List.empty(growable: true),
    );

    for (int i = 0; i < survey!.questions.length; i++) {
      switch (survey!.questions[i].runtimeType) {
        case TextQuestion:
          surveyAnswer.answers.add(
            core.TextQuestionAnswerEntity(
              id: survey!.questions[i].id,
              type: survey!.questions[i].type,
              answer: '',
            ),
          );
          break;
        case SingleSelectQuestion:
          surveyAnswer.answers.add(
            core.SingleSelectQuestionAnswerEntity(
              id: survey!.questions[i].id,
              type: survey!.questions[i].type,
              selectedAnswerString: '',
            ),
          );
          break;
        case MultiSelectQuestion:
          surveyAnswer.answers.add(
            core.MultiSelectQuestionAnswerEntity(
              id: survey!.questions[i].id,
              type: survey!.questions[i].type,
              selectedAnswerStrings: const [],
            ),
          );
          break;
        case NumberRatingQuestion:
          surveyAnswer.answers.add(
            core.NumberRatingQuestionAnswerEntity(
              id: survey!.questions[i].id,
              type: survey!.questions[i].type,
              ratedNumber: 0,
            ),
          );
          break;
        case RatingTableQuestion:
          surveyAnswer.answers.add(
            core.RatingTableQuestionAnswerEntity(
              id: survey!.questions[i].id,
              type: survey!.questions[i].type,
              ratingAnswers: const [],
            ),
          );
          break;
        case DateQuestion:
          surveyAnswer.answers.add(
            core.DateQuestionAnswerEntity(
              id: survey!.questions[i].id,
              type: survey!.questions[i].type,
              date: DateTime(0),
            ),
          );
          break;
        case TimeQuestion:
          surveyAnswer.answers.add(
            core.TimeQuestionAnswerEntity(
              id: survey!.questions[i].id,
              type: survey!.questions[i].type,
              time: const TimeOfDay(hour: 0, minute: 0),
              timeSpent: 0,
            ),
          );
          break;
        case DateAndTimeQuestion:
          surveyAnswer.answers.add(
            core.DateAndTimeQuestionAnswerEntity(
              id: survey!.questions[i].id,
              type: survey!.questions[i].type,
              date: DateTime(0),
              time: const TimeOfDay(hour: 0, minute: 0),
              timeSpent: 0,
            ),
          );
          break;
      }
    }

    return true;
  }
}
