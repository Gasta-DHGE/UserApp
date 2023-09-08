import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/services/i_save_service.dart';

import '../models/models.dart';
import '../services/i_survey_service.dart';

class ScannerPageController {
  ISurveyService surveyService;
  ISaveService saveService;

  ScannerPageController(
      {required this.surveyService, required this.saveService}) {
    loadSurveyAsync();
  }

  Survey? survey;
  late core.SurveyAnswerEntity surveyAnswer;
  var isLoading = false;

  void loadSurveyAsync() async {
    isLoading = true;

    survey = await surveyService.getSurveyByIdAsync(
        "583LbbNMaEgzVoXlJfVgTw3mKNI2", "8Jm8NM7DaMPRe0gDYfNK");

    surveyAnswer = core.SurveyAnswerEntity(
      id: survey != null ? survey!.id : "",
      version: survey != null ? survey!.version : 0,
      answers: List.empty(growable: true),
    );

    isLoading = false;
  }

  void onDataReceivedAsync(String data) async {
    survey = await surveyService.getSurveyByIdAsync(
        "583LbbNMaEgzVoXlJfVgTw3mKNI2", "8Jm8NM7DaMPRe0gDYfNK");

    surveyAnswer = core.SurveyAnswerEntity(
      id: survey != null ? survey!.id : "",
      version: survey != null ? survey!.version : 0,
      answers: List.empty(growable: true),
    );
  }
}
