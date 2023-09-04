import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/services/i_survey_service.dart';

import '../models/models.dart';

class TestSurveyService extends ISurveyService {
  @override
  Future<bool> sendSurveyAsync(core.SurveyAnswerModel answer) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  Future<Survey?> getSurveyByIdAsync(String userId, String surveyId) async {
    await Future.delayed(const Duration(seconds: 1));

    var survey = Survey(
        id: surveyId,
        userId: "Tnn3Gwoeb3R99rjCxzxi",
        companyId: "Tnn3Gwoeb3R99rjCxzxi",
        version: 1,
        name: "test",
        description: "test description",
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        createdDate: DateTime.now(),
        lastModifiedDate: DateTime.now(),
        questions: [
          Question(
              id: "Tnz3Gwoeb3R99rjCxzxi",
              isOptional: false,
              title: 'What could we do better?',
              description: 'test description',
              content: Map<String, dynamic>(),
              type: core.QuestionType.text),
          Question(
              id: "Tnz3Gwoeb3R99ejCxzxi",
              isOptional: false,
              title: 'What could we do better?',
              description: 'test description',
              content: Map<String, dynamic>(),
              type: core.QuestionType.select),
          Question(
              id: "Tnz3Gwoeb3Rs9rjCxzxi",
              isOptional: true,
              title: 'What could we do better?',
              description: 'test description',
              content: Map<String, dynamic>(),
              type: core.QuestionType.multiSelect),
        ]);

    return survey;
  }

  @override
  Future createSurveyAsync(String userId, Survey survey) {
    // TODO: implement createSurveyAsync
    throw UnimplementedError();
  }
}
