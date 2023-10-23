import '../models/models.dart';

abstract class ISurveyService {
  Future<Survey> getSurveyByIdAsync(String userId, String surveyId);
  Future createSurveyAsync(String userId, Survey survey);
  Future<void> sendSurveyAsync(String userId, SurveyAnswer answer);
}
