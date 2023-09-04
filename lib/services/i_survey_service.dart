import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/survey.dart' as s;

abstract class ISurveyService {
  Future<s.Survey?> getSurveyByIdAsync(String userId, String surveyId);
  Future createSurveyAsync(String userId, s.Survey survey);
  Future<bool> sendSurveyAsync(SurveyAnswerModel answer);
}
