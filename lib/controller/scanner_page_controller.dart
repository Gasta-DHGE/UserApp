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
          authenticationService.user!.firebaseUser.uid, data);
    } catch (e) {
      survey = null;
    }

    if (survey == null) return false;

    surveyAnswer = core.SurveyAnswerEntity(
      id: survey != null ? survey!.id : "",
      version: survey != null ? survey!.version : 0,
      answers: List.empty(growable: true),
    );

    return true;
  }
}
