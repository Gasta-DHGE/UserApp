import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/utility/observable.dart';

import '../models/models.dart';
import '../service_provider.dart';
import '../services/i_survey_service.dart';

class ScannerPageController {
  ISurveyService surveyService = ServiceProvider.instance.surveyService;

  var survey = Observable<Survey?>(null);
  late core.SurveyAnswerEntity surveyAnswer;
  var isLoading = Observable<bool>(false);

  ScannerPageController() {
    loadSurveyAsync();
  }

  void loadSurveyAsync() async {
    isLoading.value = true;

    survey.value = await surveyService.getSurveyByIdAsync(
        "583LbbNMaEgzVoXlJfVgTw3mKNI2", "bgkwuOZ5SK3I7YGT62Ff");

    surveyAnswer = core.SurveyAnswerEntity(
        id: survey.value != null ? survey.value!.id : "",
        version: survey.value != null ? survey.value!.version : 0,
        answers: List.empty(growable: true));

    isLoading.value = false;
  }
}
