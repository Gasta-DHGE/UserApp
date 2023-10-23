import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/services/i_survey_service.dart';
import 'package:gasta_user_app/services/mapping_service.dart';

import '../models/models.dart';

class TestSurveyService extends ISurveyService {
  @override
  Future<Survey> getSurveyByIdAsync(String userId, String surveyId) async {
    await Future.delayed(const Duration(seconds: 1));

    var options = ["Option 1", "Option 2", "Option 3", "Option 4"];

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
      rewards: [],
      rewardExpirationDate: DateTime.now(),
      rewardVariant: SurveyRewardVariantType.first,
      questions: [
        TextQuestion(
            id: "Tnz3Gwoeb3R99rjCxzxi",
            isOptional: false,
            title: 'What could we do better?',
            description: 'test description',
            type: core.QuestionType.text),
        SingleSelectQuestion(
            id: "Tnz3Gwoeb3R99ejCxzxi",
            isOptional: false,
            title: 'What could we do better?',
            description: 'test description',
            options: options,
            type: core.QuestionType.select),
        MultiSelectQuestion(
            id: "Tnz3Gwoeb3Rs9rjCxzxi",
            isOptional: true,
            title: 'What could we do better?',
            description: 'test description',
            options: options,
            type: core.QuestionType.multiSelect),
      ],
      questionsAreInFixedOrder: true,
    );

    // ignore: unused_local_variable
    var json = MappingService.map<Survey, core.SurveyModel>(survey)
        .toJson()
        .toString();

    return survey;
  }

  @override
  Future createSurveyAsync(String userId, Survey survey) {
    // TODO: implement createSurveyAsync
    throw UnimplementedError();
  }

  @override
  Future<void> sendSurveyAsync(String userId, SurveyAnswer answer) {
    // TODO: implement sendSurveyAsync
    throw UnimplementedError();
  }
}
