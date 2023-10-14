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

    if ((FROM == core.AddressEntity || FROM == core.AddressModel) &&
        TO == Address) {
      return _addressEntityToAddress(source as core.AddressEntity) as TO;
    }
    if (FROM == Address && TO == core.AddressEntity) {
      return _addressToAddressEntity(source as Address) as TO;
    }
    if (FROM == SurveyAnswer && TO == core.SurveyAnswerModel) {
      return core.AddressModel.fromEntity(
          _addressToAddressEntity(source as Address)) as TO;
    }

    if ((FROM == core.UserEntity || FROM == core.UserModel) &&
        TO == GastaUser) {
      return _userEntityToGastaUser(source as core.UserEntity) as TO;
    }
    if (FROM == GastaUser && TO == core.UserEntity) {
      return _gastaUserToUserEntity(source as GastaUser) as TO;
    }
    if (FROM == GastaUser && TO == core.UserModel) {
      return core.UserModel.fromEntity(
          _gastaUserToUserEntity(source as GastaUser)) as TO;
    }

    if ((FROM == core.OpeningTimeEntity || FROM == core.OpeningTimeModel) &&
        TO == OpeningTime) {
      return _openingTimeEntityToOpeningTime(source as core.OpeningTimeEntity)
          as TO;
    }
    if (FROM == OpeningTime && TO == core.OpeningTimeEntity) {
      return _openingTimeToOpeningTimeEntity(source as OpeningTime) as TO;
    }
    if (FROM == OpeningTime && TO == core.OpeningTimeModel) {
      return core.OpeningTimeModel.fromEntity(
          _openingTimeToOpeningTimeEntity(source as OpeningTime)) as TO;
    }

    if ((FROM == core.CompanyInfoEntity || FROM == core.CompanyInfoModel) &&
        TO == CompanyInfo) {
      return _companyInfoEntityToCompanyInfo(source as core.CompanyInfoEntity)
          as TO;
    }
    if (FROM == CompanyInfo && TO == core.CompanyInfoEntity) {
      return _companyInfoToCompanyInfoEntity(source as CompanyInfo) as TO;
    }
    if (FROM == CompanyInfo && TO == core.CompanyInfoModel) {
      return core.CompanyInfoModel.fromEntity(
          _companyInfoToCompanyInfoEntity(source as CompanyInfo)) as TO;
    }

    if ((FROM == core.CouponEntity || FROM == core.CouponModel) &&
        TO == Coupon) {
      return _couponEntityToCoupon(source as core.CouponEntity) as TO;
    }
    if (FROM == Coupon && TO == core.CouponEntity) {
      return _couponToCouponEntity(source as Coupon) as TO;
    }
    if (FROM == Coupon && TO == core.CouponModel) {
      return core.CouponModel.fromEntity(
          _couponToCouponEntity(source as Coupon)) as TO;
    }

    if ((FROM == core.RatingTableAnswerEntity ||
            FROM == core.RatingTableAnswerModel) &&
        TO == RatingAnswer) {
      return _ratingTableAnswerEntityToRatingAnswer(
          source as core.RatingTableAnswerEntity) as TO;
    }
    if (FROM == RatingAnswer && TO == core.RatingTableAnswerEntity) {
      return _ratingAnswerToRatingTableAnswerEntity(source as RatingAnswer)
          as TO;
    }
    if (FROM == RatingAnswer && TO == core.RatingTableAnswerModel) {
      return core.RatingTableAnswerModel.fromEntity(
          _ratingAnswerToRatingTableAnswerEntity(source as RatingAnswer)) as TO;
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
    return Survey(
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
      rewards: source.rewards
          .map((e) => MappingService.map<core.RewardEntity, Reward>(e))
          .toList(),
      rewardExpirationDate: source.rewardExpirationDate,
      rewardVariant: source.rewardVariant,
      questions: source.questions
          .map((e) => MappingService.map<core.QuestionEntity, Question>(e))
          .toList(),
      questionsAreInFixedOrder: source.questionsAreInFixedOrder,
    );
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
    switch (source.runtimeType) {
      case core.TextQuestionEntity:
        return TextQuestion(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
        );
      case core.SingleSelectQuestionEntity:
        return SingleSelectQuestion(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
          options: (source as core.SingleSelectQuestionEntity).options,
        );
      case core.MultiSelectQuestionEntity:
        return MultiSelectQuestion(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
          options: (source as core.MultiSelectQuestionEntity).options,
        );
      case core.NumberRatingQuestionEntity:
        return NumberRatingQuestion(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
          minRating: (source as core.NumberRatingQuestionEntity).minRating,
          maxRating: source.maxRating,
        );
      case core.RatingTableQuestionEntity:
        return RatingTableQuestion(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
          ratingHeaders:
              (source as core.RatingTableQuestionEntity).ratingHeaders,
          ratingQuestions: source.ratingQuestions,
        );
      case core.DateQuestionEntity:
        return DateQuestion(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
        );
      case core.TimeQuestionEntity:
        return TimeQuestion(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
        );
      case core.DateAndTimeQuestionEntity:
        return DateAndTimeQuestion(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
        );
      default:
        throw Exception("Type not mapable");
    }
  }

  static core.QuestionEntity _questionToQuestionEntity(Question source) {
    switch (source.runtimeType) {
      case TextQuestion:
        return core.TextQuestionEntity(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
        );
      case SingleSelectQuestion:
        return core.SingleSelectQuestionEntity(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
          options: (source as SingleSelectQuestion).options,
        );
      case MultiSelectQuestion:
        return core.MultiSelectQuestionEntity(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
          options: (source as MultiSelectQuestion).options,
        );
      case NumberRatingQuestion:
        return core.NumberRatingQuestionEntity(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
          minRating: (source as NumberRatingQuestion).minRating,
          maxRating: source.maxRating,
        );
      case RatingTableQuestion:
        return core.RatingTableQuestionEntity(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
          ratingHeaders: (source as RatingTableQuestion).ratingHeaders,
          ratingQuestions: source.ratingQuestions,
        );
      case DateQuestion:
        return core.DateQuestionEntity(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
        );
      case TimeQuestion:
        return core.TimeQuestionEntity(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
        );
      case DateAndTimeQuestion:
        return core.DateAndTimeQuestionEntity(
          id: source.id,
          isOptional: source.isOptional,
          type: source.type,
          title: source.title,
          description: source.description,
        );
      default:
        throw Exception("Type not mapable");
    }
  }

  static SurveyAnswer _surveyAnswerEntityToSurveyAnswer(
      core.SurveyAnswerEntity source) {
    var result = SurveyAnswer(
      id: source.id,
      version: source.version,
      rewardChoiceIndex: source.rewardChoiceIndex,
      answers: List.empty(growable: true),
    );

    for (var answer in source.answers) {
      result.answers
          .add(map<core.QuestionAnswerEntity, QuestionAnswer>(answer));
    }

    return result;
  }

  static core.SurveyAnswerEntity _surveyAnswerToSurveyAnswerEntity(
      SurveyAnswer source) {
    var result = core.SurveyAnswerEntity(
      id: source.id,
      version: source.version,
      rewardChoiceIndex: source.rewardChoiceIndex,
      answers: List.empty(growable: true),
    );

    for (var answer in source.answers) {
      result.answers
          .add(map<QuestionAnswer, core.QuestionAnswerEntity>(answer));
    }

    return result;
  }

  static QuestionAnswer _questionAnswerEntityToQuestionAnswer(
      core.QuestionAnswerEntity source) {
    switch (source.runtimeType) {
      case core.TextQuestionAnswerEntity:
        return TextQuestionAnswer(
          id: source.id,
          type: source.type,
          answer: (source as core.TextQuestionAnswerEntity).answer,
        );
      case core.SingleSelectQuestionAnswerEntity:
        return SingleSelectQuestionAnswer(
          id: source.id,
          type: source.type,
          selectedAnswerString:
              (source as core.SingleSelectQuestionAnswerEntity)
                  .selectedAnswerString,
        );
      case core.MultiSelectQuestionAnswerEntity:
        return MultiSelectQuestionAnswer(
          id: source.id,
          type: source.type,
          selectedAnswerStrings:
              (source as core.MultiSelectQuestionAnswerEntity)
                  .selectedAnswerStrings,
        );
      case core.NumberRatingQuestionAnswerEntity:
        return NumberRatingQuestionAnswer(
          id: source.id,
          type: source.type,
          ratedNumber:
              (source as core.NumberRatingQuestionAnswerEntity).ratedNumber,
        );
      case core.RatingTableQuestionAnswerEntity:
        return RatingTableQuestionAnswer(
          id: source.id,
          type: source.type,
          ratingAnswers: (source as core.RatingTableQuestionAnswerEntity)
              .ratingAnswers
              .map((e) => MappingService.map<core.RatingTableAnswerEntity,
                  RatingAnswer>(e))
              .toList(),
        );
      case core.DateQuestionAnswerEntity:
        return DateQuestionAnswer(
          id: source.id,
          type: source.type,
          date: (source as core.DateQuestionAnswerEntity).date,
        );
      case core.TimeQuestionAnswerEntity:
        return TimeQuestionAnswer(
          id: source.id,
          type: source.type,
          time: (source as core.TimeQuestionAnswerEntity).time,
          timeSpent: source.timeSpent,
        );
      case core.DateAndTimeQuestionAnswerEntity:
        return DateAndTimeQuestionAnswer(
          id: source.id,
          type: source.type,
          date: (source as core.DateAndTimeQuestionAnswerEntity).date,
          time: source.time,
          timeSpent: source.timeSpent,
        );
      default:
        throw Exception("Type not mapable");
    }
  }

  static core.QuestionAnswerEntity _questionAnswerToQuestionAnswerEntity(
      QuestionAnswer source) {
    switch (source.runtimeType) {
      case TextQuestionAnswer:
        return core.TextQuestionAnswerEntity(
          id: source.id,
          type: source.type,
          answer: (source as TextQuestionAnswer).answer,
        );
      case SingleSelectQuestionAnswer:
        return core.SingleSelectQuestionAnswerEntity(
          id: source.id,
          type: source.type,
          selectedAnswerString:
              (source as SingleSelectQuestionAnswer).selectedAnswerString,
        );
      case MultiSelectQuestionAnswer:
        return core.MultiSelectQuestionAnswerEntity(
          id: source.id,
          type: source.type,
          selectedAnswerStrings:
              (source as MultiSelectQuestionAnswer).selectedAnswerStrings,
        );
      case NumberRatingQuestionAnswer:
        return core.NumberRatingQuestionAnswerEntity(
          id: source.id,
          type: source.type,
          ratedNumber: (source as NumberRatingQuestionAnswer).ratedNumber,
        );
      case RatingTableQuestionAnswer:
        return core.RatingTableQuestionAnswerEntity(
          id: source.id,
          type: source.type,
          ratingAnswers: (source as RatingTableQuestionAnswer)
              .ratingAnswers
              .map((e) => MappingService.map<RatingAnswer,
                  core.RatingTableAnswerEntity>(e))
              .toList(),
        );
      case DateQuestionAnswer:
        return core.DateQuestionAnswerEntity(
          id: source.id,
          type: source.type,
          date: (source as DateQuestionAnswer).date,
        );
      case TimeQuestionAnswer:
        return core.TimeQuestionAnswerEntity(
          id: source.id,
          type: source.type,
          time: (source as TimeQuestionAnswer).time,
          timeSpent: source.timeSpent,
        );
      case DateAndTimeQuestionAnswer:
        return core.DateAndTimeQuestionAnswerEntity(
          id: source.id,
          type: source.type,
          date: (source as DateAndTimeQuestionAnswer).date,
          time: source.time,
          timeSpent: source.timeSpent,
        );
      default:
        throw Exception("Type not mapable");
    }
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

  static Address _addressEntityToAddress(core.AddressEntity source) {
    return Address(
        city: source.city,
        street: source.street,
        streetNumber: source.streetNumber,
        additionalInformation: source.additionalInformation,
        postcode: source.postcode,
        posLongitude: source.posLongitude,
        posLatitude: source.posLatitude);
  }

  static core.AddressEntity _addressToAddressEntity(Address source) {
    return core.AddressEntity(
        city: source.city,
        street: source.street,
        streetNumber: source.streetNumber,
        additionalInformation: source.additionalInformation,
        postcode: source.postcode,
        posLongitude: source.posLongitude,
        posLatitude: source.posLatitude);
  }

  static GastaUser _userEntityToGastaUser(core.UserEntity source) {
    return GastaUser(
      firstName: source.firstName,
      lastName: source.lastName,
      birthDate: source.birthDate,
      gender: source.gender,
      diet: source.diet,
      address: MappingService.map<core.AddressEntity, Address>(source.address),
    );
  }

  static core.UserEntity _gastaUserToUserEntity(GastaUser source) {
    return core.UserEntity(
      firstName: source.firstName,
      lastName: source.lastName,
      birthDate: source.birthDate,
      gender: source.gender,
      diet: source.diet,
      address: MappingService.map<Address, core.AddressEntity>(source.address),
    );
  }

  static OpeningTime _openingTimeEntityToOpeningTime(
      core.OpeningTimeEntity source) {
    return OpeningTime(
      isOpen: source.isOpen,
      from: source.from,
      to: source.to,
    );
  }

  static core.OpeningTimeEntity _openingTimeToOpeningTimeEntity(
      OpeningTime source) {
    return core.OpeningTimeEntity(
      isOpen: source.isOpen,
      from: source.from,
      to: source.to,
    );
  }

  static CompanyInfo _companyInfoEntityToCompanyInfo(
      core.CompanyInfoEntity source) {
    Map<DayOfWeek, OpeningTime> openingDays = <DayOfWeek, OpeningTime>{};
    for (var day = 0; day < DayOfWeek.values.length; day++) {
      openingDays[DayOfWeek.values[day]] =
          MappingService.map<core.OpeningTimeEntity, OpeningTime>(
              source.openingDays[core.DayOfWeek.values[day]]!);
    }

    return CompanyInfo(
      name: source.name,
      address: MappingService.map<core.AddressEntity, Address>(source.address),
      openingDays: openingDays,
      companyId: source.companyId,
    );
  }

  static core.CompanyInfoEntity _companyInfoToCompanyInfoEntity(
      CompanyInfo source) {
    Map<core.DayOfWeek, core.OpeningTimeEntity> openingDays =
        <core.DayOfWeek, core.OpeningTimeEntity>{};
    for (var day = 0; day < core.DayOfWeek.values.length; day++) {
      openingDays[core.DayOfWeek.values[day]] =
          MappingService.map<OpeningTime, core.OpeningTimeEntity>(
              source.openingDays[DayOfWeek.values[day]]!);
    }

    return core.CompanyInfoEntity(
      name: source.name,
      address: MappingService.map<Address, core.AddressEntity>(source.address),
      openingDays: openingDays,
      companyId: source.companyId,
    );
  }

  static Coupon _couponEntityToCoupon(core.CouponEntity source) {
    return Coupon(
      id: source.id,
      surveyId: source.surveyId,
      expiringDate:
          core.Util.getDateTimeBySecondsTimeStamp(source.expiringDate),
      reward: MappingService.map<core.RewardEntity, Reward>(source.reward),
      companyInfo: MappingService.map<core.CompanyInfoEntity, CompanyInfo>(
          source.companyInfo),
    );
  }

  static core.CouponEntity _couponToCouponEntity(Coupon source) {
    return core.CouponEntity(
      id: source.id,
      surveyId: source.surveyId,
      expiringDate:
          core.Util.getSecondsTimeStampByDateTime(source.expiringDate),
      reward: MappingService.map<Reward, core.RewardEntity>(source.reward),
      companyInfo: MappingService.map<CompanyInfo, core.CompanyInfoEntity>(
          source.companyInfo),
    );
  }

  static RatingAnswer _ratingTableAnswerEntityToRatingAnswer(
      core.RatingTableAnswerEntity source) {
    return RatingAnswer(
      ratingQuestion: source.ratingQuestion,
      rating: source.rating,
    );
  }

  static core.RatingTableAnswerEntity _ratingAnswerToRatingTableAnswerEntity(
      RatingAnswer source) {
    return core.RatingTableAnswerEntity(
      ratingQuestion: source.ratingQuestion,
      rating: source.rating,
    );
  }
}
