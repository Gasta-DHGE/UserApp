import 'package:gastas_core/gastas_core.dart';
import 'package:gastas_user_app/services/i_survey_service.dart';
import 'package:uuid/uuid.dart';

class TestSurveyService extends ISurveyService {
  @override
  Future<Survey> getSurveyAsync(String surveyId) async {
    await Future.delayed(const Duration(seconds: 2));
    var uuid = const Uuid();

    Survey survey1 = Survey();
    survey1.surveyId = "bb0fbff0-2fe2-11ee-8cc7-099e5572a5a2";
    survey1.surveyItems = [
      SurveyItem(
          question: 'What could we do better?',
          data: [],
          questionId: uuid.v1(),
          type: 'TextSurveyItem'),
      SurveyItem(
          question: 'What could we do better?',
          data: [
            ["Option 1", "Option 2", "Option 3", "Option 4"]
          ],
          questionId: uuid.v1(),
          type: 'SingleSelectionSurveyItem')
    ];

    Survey survey2 = Survey();
    survey2.surveyId = "bb0fbff0-2fe2-11ee-8cc7-099e5572a5a2";

    return survey1;
  }

  @override
  Future<bool> sendSurveyAsync(SurveyAnswer answer) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
