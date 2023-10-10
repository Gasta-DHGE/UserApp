import 'package:gasta_user_app/models/survey_data.dart';

abstract class ISaveService {
  Future saveSurveyAsync(String userId, SurveyData survey);
  Future saveSurveysAsync(String userId, List<SurveyData> surveys);
  Future updateSurveyAsync(String userId, String surveyId, SurveyData survey);
  Future removeSurvey(String userId, String surveyId);
  Future removeSurveys(String userId, List<String> surveyIds);
  Future removeAllSurveysAsync(String userId);
  Future<List<SurveyData>> loadSurveysAsync(String userId);
}
