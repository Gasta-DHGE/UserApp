import 'package:gasta_user_app/models/survey_data.dart';

abstract class ISaveService {
  void saveSurveyAsync(SurveyData survey);
  void saveSurveysAsync(List<SurveyData> surveys);
  Future<List<SurveyData>> loadSurveysAsync();
}
