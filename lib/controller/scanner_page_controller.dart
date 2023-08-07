import 'package:gastas_core/models/survey/survey.dart';
import 'package:gastas_core/models/survey/survey_answer.dart';

import '../service_provider.dart';
import '../services/i_survey_service.dart';

class ScannerPageController {
  ISurveyService surveyService = ServiceProvider.instance.surveyService;

  Survey? survey;
  SurveyAnswer surveyAnswer = SurveyAnswer();

  ScannerPageController() {
    survey = surveyService.getSurvey();
  }
}
