import 'dart:convert';

import 'package:gasta_user_app/models/survey_data.dart';
import 'package:gasta_user_app/services/i_save_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveService implements ISaveService {
  SharedPreferences? sharedPreferences;
  @override
  Future<List<SurveyData>> loadSurveysAsync() async {
    sharedPreferences ??= await SharedPreferences.getInstance();

    var strings = sharedPreferences!.getStringList("surveys") ??
        List.empty(growable: true);
    List<SurveyData> surveys = [];

    for (var string in strings) {
      surveys.add(SurveyData.fromJson(jsonDecode(string)));
    }

    return surveys;
  }

  @override
  void saveSurveyAsync(SurveyData survey) async {
    List<String> strings = [];
    List<SurveyData> loadedSurveys = await loadSurveysAsync();

    loadedSurveys.add(survey);

    for (var survey in loadedSurveys) {
      strings.add(jsonEncode(survey.toJson()));
    }

    sharedPreferences!.setStringList("surveys", strings);
  }

  @override
  void saveSurveysAsync(List<SurveyData> surveys) async {
    List<String> strings = [];
    List<SurveyData> loadedSurveys = await loadSurveysAsync();

    for (var survey in surveys) {
      loadedSurveys.add(survey);
    }

    for (var survey in loadedSurveys) {
      strings.add(jsonEncode(survey.toJson()));
    }

    sharedPreferences!.setStringList("surveys", strings);
  }

  @override
  void removeAllSurveysAsync() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
    sharedPreferences!.setStringList("surveys", List.empty());
  }

  @override
  void removeSurvey(String id) async {
    List<SurveyData> loadedSurveys = await loadSurveysAsync();
    loadedSurveys.removeWhere((element) => element.survey.id == id);
    saveSurveysAsync(loadedSurveys);
  }

  @override
  void removeSurveys(List<String> ids) async {
    List<SurveyData> loadedSurveys = await loadSurveysAsync();
    loadedSurveys.removeWhere((element) => ids.contains(element.survey.id));
    saveSurveysAsync(loadedSurveys);
  }
}
