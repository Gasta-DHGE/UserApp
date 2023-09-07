import 'package:gasta_user_app/models/survey_data.dart';

abstract class ISaveService {
  void saveSurveyAsync(SurveyData survey);
  void saveSurveysAsync(List<SurveyData> surveys);
  void removeSurvey(String id);
  void removeSurveys(List<String> ids);
  void removeAllSurveysAsync();
  Future<List<SurveyData>> loadSurveysAsync();
}
