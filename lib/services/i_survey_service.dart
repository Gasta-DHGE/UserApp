import 'package:gasta_core/gasta_core.dart';

abstract class ISurveyService {
  Future<Survey> getSurveyAsync(String surveyId);
  Future<bool> sendSurveyAsync(SurveyAnswer answer);
}
