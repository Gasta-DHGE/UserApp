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
    sharedPreferences ??= await SharedPreferences.getInstance();

    var strings = sharedPreferences!.getStringList("surveys") ??
        List.empty(growable: true);
    List<SurveyData> loaded = [];

    for (var string in strings) {
      loaded.add(SurveyData.fromJson(jsonDecode(string)));
    }

    loaded.add(survey);

    for (var survey in loaded) {
      strings.add(jsonEncode(survey.toJson()));
    }

    sharedPreferences!.setStringList("surveys", strings);
  }

  @override
  void saveSurveysAsync(List<SurveyData> surveys) async {
    sharedPreferences ??= await SharedPreferences.getInstance();

    var strings = sharedPreferences!.getStringList("surveys") ??
        List.empty(growable: true);
    List<SurveyData> loaded = [];

    for (var string in strings) {
      loaded.add(SurveyData.fromJson(jsonDecode(string)));
    }

    for (var survey in surveys) {
      loaded.add(survey);
    }

    for (var survey in loaded) {
      strings.add(jsonEncode(survey.toJson()));
    }

    sharedPreferences!.setStringList("surveys", strings);
  }
}
