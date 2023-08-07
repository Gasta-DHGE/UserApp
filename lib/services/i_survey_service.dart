import 'package:gastas_core/src/models/survey/survey.dart';
import 'package:gastas_core/src/models/survey/survey_answer.dart';

abstract class ISurveyService {
  Future<Survey> getSurveyAsync(String surveyId);
  Future<bool> sendSurveyAsync(SurveyAnswer answer);
}
