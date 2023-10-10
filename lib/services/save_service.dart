import 'dart:convert';

import 'package:gasta_user_app/models/survey_data.dart';
import 'package:gasta_user_app/services/i_save_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveService implements ISaveService {
  SharedPreferences? sharedPreferences;
  @override
  Future<List<SurveyData>> loadSurveysAsync(String userId) async {
    sharedPreferences ??= await SharedPreferences.getInstance();

    var strings =
        sharedPreferences!.getStringList(userId) ?? List.empty(growable: true);
    List<SurveyData> surveys = [];

    for (var string in strings) {
      surveys.add(SurveyData.fromJson(jsonDecode(string)));
    }

    return surveys;
  }

  @override
  Future saveSurveyAsync(String userId, SurveyData survey) async {
    List<String> strings = [];
    List<SurveyData> loadedSurveys = await loadSurveysAsync(userId);

    loadedSurveys
        .removeWhere((element) => element.survey.id == survey.survey.id);
    loadedSurveys.add(survey);

    for (var survey in loadedSurveys) {
      strings.add(jsonEncode(survey.toJson()));
    }

    await sharedPreferences!.setStringList(userId, strings);
  }

  @override
  Future saveSurveysAsync(String userId, List<SurveyData> surveys) async {
    List<String> strings = [];
    List<SurveyData> loadedSurveys = await loadSurveysAsync(userId);

    for (var survey in surveys) {
      loadedSurveys
          .removeWhere((element) => element.survey.id == survey.survey.id);
      loadedSurveys.add(survey);
    }

    for (var survey in loadedSurveys) {
      strings.add(jsonEncode(survey.toJson()));
    }

    await sharedPreferences!.setStringList(userId, strings);
  }

  Future overrideSurveysAsync(String userId, List<SurveyData> surveys) async {
    await removeAllSurveysAsync(userId);

    List<String> strings = [];
    for (var survey in surveys) {
      strings.add(jsonEncode(survey.toJson()));
    }

    await sharedPreferences!.setStringList(userId, strings);
  }

  @override
  Future removeAllSurveysAsync(String userId) async {
    sharedPreferences ??= await SharedPreferences.getInstance();
    await sharedPreferences!.setStringList(userId, List.empty());
  }

  @override
  Future removeSurvey(String userId, String surveyId) async {
    List<SurveyData> loadedSurveys = await loadSurveysAsync(userId);
    loadedSurveys.removeWhere((element) => element.survey.id == surveyId);
    await overrideSurveysAsync(userId, loadedSurveys);
  }

  @override
  Future removeSurveys(String userId, List<String> surveyIds) async {
    List<SurveyData> loadedSurveys = await loadSurveysAsync(userId);
    loadedSurveys
        .removeWhere((element) => surveyIds.contains(element.survey.id));
    await overrideSurveysAsync(userId, loadedSurveys);
  }

  @override
  Future updateSurveyAsync(
      String userId, String surveyId, SurveyData survey) async {
    await removeSurvey(userId, surveyId);
    await saveSurveyAsync(userId, survey);
  }
}
