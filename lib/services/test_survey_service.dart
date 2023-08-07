import 'package:gastas_core/models/survey/survey.dart';
import 'package:gastas_core/models/survey/survey_item.dart';
import 'package:gastas_user_app/services/i_survey_service.dart';
import 'package:uuid/uuid.dart';

class TestSurveyService extends ISurveyService {
  @override
  Survey getSurvey() {
    var uuid = const Uuid();
    Survey survey = Survey();
    survey.surveyId = "bb0fbff0-2fe2-11ee-8cc7-099e5572a5a2";
    survey.surveyItems = [
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

    return survey;
  }
}
