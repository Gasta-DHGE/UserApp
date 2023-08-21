import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gastas_user_app/utility/observable.dart';

import '../models/models.dart';
import '../service_provider.dart';
import '../services/i_survey_service.dart';

class ScannerPageController {
  ISurveyService surveyService = ServiceProvider.instance.surveyService;

  var survey = Observable<Survey?>(null);
  core.SurveyAnswer surveyAnswer = core.SurveyAnswer();
  var isLoading = Observable<bool>(false);

  ScannerPageController() {
    loadSurveyAsync();
  }

  void loadSurveyAsync() async {
    isLoading.value = true;

    survey.value = await surveyService.getSurveyByIdAsync(
        "583LbbNMaEgzVoXlJfVgTw3mKNI2", "10kw7Wfcd337fN7tYhAf");

    isLoading.value = false;
  }
}
