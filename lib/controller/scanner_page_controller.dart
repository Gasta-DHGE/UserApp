import 'package:gastas_core/gastas_core.dart';
import 'package:gastas_user_app/utility/observable.dart';

import '../service_provider.dart';
import '../services/i_survey_service.dart';

class ScannerPageController {
  ISurveyService surveyService = ServiceProvider.instance.surveyService;

  var survey = Observable<Survey?>(null);
  SurveyAnswer surveyAnswer = SurveyAnswer();
  var isLoading = Observable<bool>(false);

  ScannerPageController() {
    loadSurveyAsync();
  }

  void loadSurveyAsync() async {
    isLoading.value = true;
    survey.value = await surveyService.getSurveyAsync("");
    isLoading.value = false;
  }
}
