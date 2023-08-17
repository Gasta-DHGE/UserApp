import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/utility/observable.dart';

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
