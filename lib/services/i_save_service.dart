import 'package:gasta_user_app/models/survey_data.dart';

abstract class ISaveService {
  Future saveSurveyAsync(SurveyData survey);
  Future saveSurveysAsync(List<SurveyData> surveys);
  Future updateSurveyAsync(String id, SurveyData survey);
  Future removeSurvey(String id);
  Future removeSurveys(List<String> ids);
  Future removeAllSurveysAsync();
  Future<List<SurveyData>> loadSurveysAsync();
}
