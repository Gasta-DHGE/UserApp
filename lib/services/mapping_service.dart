import 'package:gasta_core/gasta_core.dart' as core;
import '../models/models.dart';

class MappingService {
  static TO map<FROM, TO>(FROM source) {
    if ((FROM == core.SurveyEntity || FROM == core.SurveyModel) &&
        TO == Survey) {
      return _surveyEntityToSurvey(source as core.SurveyEntity) as TO;
    }
    if (FROM == Survey && TO == core.SurveyEntity) {
      return _surveyToSurveyEntity(source as Survey) as TO;
    }
    if (FROM == Survey && TO == core.SurveyModel) {
      return core.SurveyModel.fromEntity(
          _surveyToSurveyEntity(source as Survey)) as TO;
    }

    if ((FROM == core.QuestionEntity || FROM == core.QuestionModel) &&
        TO == Question) {
      return _questionEntityToQuestion(source as core.QuestionEntity) as TO;
    }
    if (FROM == Question && TO == core.QuestionEntity) {
      return _questionToQuestionEntity(source as Question) as TO;
    }
    if (FROM == Question && TO == core.QuestionModel) {
      return core.QuestionModel.fromEntity(
          _questionToQuestionEntity(source as Question)) as TO;
    }

    if ((FROM == core.SurveyAnswerEntity || FROM == core.SurveyAnswerModel) &&
        TO == SurveyAnswer) {
      return _surveyAnswerEntityToSurveyAnswer(
          source as core.SurveyAnswerEntity) as TO;
    }
    if (FROM == SurveyAnswer && TO == core.SurveyAnswerEntity) {
      return _surveyAnswerToSurveyAnswerEntity(source as SurveyAnswer) as TO;
    }
    if (FROM == SurveyAnswer && TO == core.SurveyAnswerModel) {
      return core.SurveyAnswerModel.fromEntity(
          _surveyAnswerToSurveyAnswerEntity(source as SurveyAnswer)) as TO;
    }

    if ((FROM == core.QuestionAnswerEntity ||
            FROM == core.QuestionAnswerModel) &&
        TO == QuestionAnswer) {
      return _questionAnswerEntityToQuestionAnswer(
          source as core.QuestionAnswerEntity) as TO;
    }
    if (FROM == QuestionAnswer && TO == core.QuestionAnswerEntity) {
      return _questionAnswerToQuestionAnswerEntity(source as QuestionAnswer)
          as TO;
    }
    if (FROM == QuestionAnswer && TO == core.QuestionAnswerModel) {
      return core.QuestionAnswerModel.fromEntity(
              _questionAnswerToQuestionAnswerEntity(source as QuestionAnswer))
          as TO;
    }

    if ((FROM == core.RewardEntity || FROM == core.RewardModel) &&
        TO == Reward) {
      return _rewardEntityToReward(source as core.RewardEntity) as TO;
    }
    if (FROM == Reward && TO == core.RewardEntity) {
      return _rewardToRewardEntity(source as Reward) as TO;
    }
    if (FROM == Reward && TO == core.RewardModel) {
      var reward = _rewardToRewardEntity(source as Reward) as TO;
      switch (reward.runtimeType) {
        case core.ItemDiscountRewardEntity:
          return core.ItemDiscountRewardModel.fromEntity(
              reward as core.ItemDiscountRewardEntity) as TO;
        case core.FreeItemRewardEntity:
          return core.FreeItemRewardModel.fromEntity(
              reward as core.FreeItemRewardEntity) as TO;
      }
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
  static Survey _surveyEntityToSurvey(core.SurveyEntity source) {
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
      rewards: [],
      rewardExpirationDate: source.rewardExpirationDate,
      rewardVariant: source.rewardVariant,
      questions: [],
      questionsAreInFixedOrder: source.questionsAreInFixedOrder,
    );

    for (var question in source.questions) {
      result.questions.add(
          map<core.QuestionEntity, Question>(question as core.QuestionEntity));
    }

    for (var reward in source.rewards) {
      result.rewards
          .add(map<core.RewardEntity, Reward>(reward as core.RewardEntity));
    }

    return result;
  }

  static core.SurveyEntity _surveyToSurveyEntity(Survey source) {
    var result = core.SurveyEntity(
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
      rewards: [],
      rewardExpirationDate: source.rewardExpirationDate,
      rewardVariant: source.rewardVariant,
      questions: [],
      questionsAreInFixedOrder: source.questionsAreInFixedOrder,
    );

    for (var question in source.questions) {
      result.questions.add(map<Question, core.QuestionEntity>(question));
    }

    for (var reward in source.rewards) {
      result.rewards.add(map<Reward, core.RewardEntity>(reward));
    }

    return result;
  }

  static Question _questionEntityToQuestion(core.QuestionEntity source) {
    return Question(
        id: source.id,
        isOptional: source.isOptional,
        type: source.type,
        title: source.title,
        description: source.description,
        content: source.content);
  }

  static core.QuestionEntity _questionToQuestionEntity(Question source) {
    return core.QuestionEntity(
        id: source.id,
        isOptional: source.isOptional,
        type: source.type,
        title: source.title,
        description: source.description,
        content: source.content);
  }

  static SurveyAnswer _surveyAnswerEntityToSurveyAnswer(
      core.SurveyAnswerEntity source) {
    var result =
        SurveyAnswer(id: source.id, version: source.version, answers: []);

    for (var answer in source.answers) {
      result.answers
          .add(map<core.QuestionAnswerEntity, QuestionAnswer>(answer));
    }

    return result;
  }

  static core.SurveyAnswerEntity _surveyAnswerToSurveyAnswerEntity(
      SurveyAnswer source) {
    var result = core.SurveyAnswerEntity(
        id: source.id, version: source.version, answers: []);

    for (var answer in source.answers) {
      result.answers
          .add(map<QuestionAnswer, core.QuestionAnswerEntity>(answer));
    }

    return result;
  }

  static QuestionAnswer _questionAnswerEntityToQuestionAnswer(
      core.QuestionAnswerEntity source) {
    return QuestionAnswer(
      id: source.id,
      type: source.type,
      content: source.content,
    );
  }

  static core.QuestionAnswerEntity _questionAnswerToQuestionAnswerEntity(
      QuestionAnswer source) {
    return core.QuestionAnswerEntity(
      id: source.id,
      type: source.type,
      content: source.content,
    );
  }

  static Reward _rewardEntityToReward(core.RewardEntity source) {
    switch (source.runtimeType) {
      case core.ItemDiscountRewardEntity:
        return ItemDiscountReward(
          name: source.name,
          description: source.description,
          type: source.type,
          discountItem: (source as core.ItemDiscountRewardEntity).discountItem,
          discount: source.discount,
        );
      case core.FreeItemRewardEntity:
        return FreeItemReward(
          name: source.name,
          description: source.description,
          type: source.type,
          item: (source as core.FreeItemRewardEntity).item,
        );
    }

    throw Exception("Not a supported Reward type");
  }

  static core.RewardEntity _rewardToRewardEntity(Reward source) {
    switch (source.runtimeType) {
      case ItemDiscountReward:
        return core.ItemDiscountRewardEntity(
          name: source.name,
          description: source.description,
          type: source.type,
          discountItem: (source as ItemDiscountReward).discountItem,
          discount: source.discount,
        );
      case FreeItemReward:
        return core.FreeItemRewardEntity(
          name: source.name,
          description: source.description,
          type: source.type,
          item: (source as FreeItemReward).item,
        );
    }

    throw Exception("Not a supported Reward type");
  }
}
