import 'package:gasta_core/gasta_core.dart' as core;
import '../models/models.dart';

class MappingService {
  static TO map<FROM, TO>(FROM source) {
    if (FROM == core.SurveyModel && TO == Survey) {
      return _surveyModelToSurvey(source as core.SurveyModel) as TO;
    }
    if (FROM == Survey && TO == core.SurveyModel) {
      return _surveyToSurveyModel(source as Survey) as TO;
    }
    if (FROM == core.QuestionModel && TO == Question) {
      return _questionModelToQuestion(source as core.QuestionModel) as TO;
    }
    if (FROM == Question && TO == core.QuestionModel) {
      return _questionToQuestionModel(source as Question) as TO;
    }

    throw Exception("No mapping defined.");
  }

  static TO? tryMap<FROM, TO>(FROM source) {
    try {
      return map<FROM, TO>(source);
    } catch (e) {
      return null;
    }
  }

  //mappings
  static Survey _surveyModelToSurvey(core.SurveyModel source) {
    var result = Survey(
        id: source.id,
        userId: source.userId,
        companyId: source.companyId,
        version: source.version,
        name: source.name,
        description: source.description,
        startDate: source.startDate,
        endDate: source.endDate,
        createdDate: source.createdDate,
        lastModifiedDate: source.lastModifiedDate,
        questions: []);

    for (var question in source.questions) {
      result.questions.add(
          map<core.QuestionModel, Question>(question as core.QuestionModel));
    }

    return result;
  }

  static core.SurveyModel _surveyToSurveyModel(Survey source) {
    var result = core.SurveyModel(
        id: source.id,
        userId: source.userId,
        companyId: source.companyId,
        version: source.version,
        name: source.name,
        description: source.description,
        startDate: source.startDate,
        endDate: source.endDate,
        createdDate: source.createdDate,
        lastModifiedDate: source.lastModifiedDate,
        questions: []);

    for (var question in source.questions) {
      result.questions.add(map<Question, core.QuestionModel>(question));
    }

    return result;
  }

  static Question _questionModelToQuestion(core.QuestionModel source) {
    return Question(
        isOptional: source.isOptional,
        type: source.type,
        title: source.title,
        description: source.description,
        content: source.content);
  }

  static core.QuestionModel _questionToQuestionModel(Question source) {
    return core.QuestionModel(
        isOptional: source.isOptional,
        type: source.type,
        title: source.title,
        description: source.description,
        content: source.content);
  }
}
