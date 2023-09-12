import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/services/i_save_service.dart';

import '../models/models.dart';
import '../services/i_survey_service.dart';

class ScannerPageController {
  ISurveyService surveyService;
  ISaveService saveService;

  ScannerPageController(
      {required this.surveyService, required this.saveService});

  Survey? survey;
  late core.SurveyAnswerEntity surveyAnswer;
  bool surveyLoaded = false;
  var isLoading = ValueNotifier<bool>(false);

  Future onDataReceivedAsync(String data) async {
    survey = await surveyService.getSurveyByIdAsync(
        "583LbbNMaEgzVoXlJfVgTw3mKNI2", data);

    surveyAnswer = core.SurveyAnswerEntity(
      id: survey != null ? survey!.id : "",
      version: survey != null ? survey!.version : 0,
      answers: List.empty(growable: true),
    );
  }
}
