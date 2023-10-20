import 'package:equatable/equatable.dart';
import 'package:gasta_core/gasta_core.dart';

import '../models.dart';

// ignore: must_be_immutable
class Survey extends Equatable {
  String id;
  String userId;
  String companyId;
  int version;
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  DateTime createdDate;
  DateTime lastModifiedDate;
  List<Reward> rewards;
  DateTime rewardExpirationDate;
  SurveyRewardVariantType rewardVariant;
  List<Question> questions;
  bool questionsAreInFixedOrder;

  Survey(
      {required this.id,
      required this.userId,
      required this.companyId,
      required this.version,
      required this.name,
      required this.description,
      required this.startDate,
      required this.endDate,
      required this.createdDate,
      required this.lastModifiedDate,
      required this.rewards,
      required this.rewardExpirationDate,
      required this.rewardVariant,
      required this.questions,
      required this.questionsAreInFixedOrder});

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> questionMaps = [];
    for (var question in questions) {
      switch (question.runtimeType) {
        case TextQuestion:
          questionMaps.add((question as TextQuestion).toJson());
          break;
        case SingleSelectQuestion:
          questionMaps.add((question as SingleSelectQuestion).toJson());
          break;
        case MultiSelectQuestion:
          questionMaps.add((question as MultiSelectQuestion).toJson());
          break;
        case NumberRatingQuestion:
          questionMaps.add((question as NumberRatingQuestion).toJson());
          break;
        case RatingTableQuestion:
          questionMaps.add((question as RatingTableQuestion).toJson());
          break;
        case DateQuestion:
          questionMaps.add((question as DateQuestion).toJson());
          break;
        case TimeQuestion:
          questionMaps.add((question as TimeQuestion).toJson());
          break;
        case DateAndTimeQuestion:
          questionMaps.add((question as DateAndTimeQuestion).toJson());
          break;
      }
    }

    List<Map<String, dynamic>> rewardMaps = [];
    for (var reward in rewards) {
      rewardMaps.add(reward.toJson());
    }

    return {
      'id': id,
      'userId': userId,
      'companyId': companyId,
      'version': version,
      'name': name,
      'description': description,
      'startDate': Util.getSecondsTimeStampByDateTime(startDate),
      'endDate': Util.getSecondsTimeStampByDateTime(endDate),
      'createdDate': Util.getSecondsTimeStampByDateTime(createdDate),
      'lastModifiedDate': Util.getSecondsTimeStampByDateTime(lastModifiedDate),
      'rewards': rewardMaps,
      'rewardExpirationDate':
          Util.getSecondsTimeStampByDateTime(rewardExpirationDate),
      'rewardVariant': rewardVariant.toString(),
      'questions': questionMaps,
      'questionAreInFixedOrder': questionsAreInFixedOrder,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    List<Question> questions = [];
    var questionMaps = json['questions'];
    for (var map in questionMaps) {
      switch (QuestionType.values
          .firstWhere((element) => element.name == map['type'])) {
        case QuestionType.text:
          questions.add(TextQuestion.fromJson(map));
          break;
        case QuestionType.select:
          questions.add(SingleSelectQuestion.fromJson(map));
          break;
        case QuestionType.multiSelect:
          questions.add(MultiSelectQuestion.fromJson(map));
          break;
        case QuestionType.numberRating:
          questions.add(NumberRatingQuestion.fromJson(map));
          break;
        case QuestionType.ratingTable:
          questions.add(RatingTableQuestion.fromJson(map));
          break;
        case QuestionType.date:
          questions.add(DateQuestion.fromJson(map));
          break;
        case QuestionType.time:
          questions.add(TimeQuestion.fromJson(map));
          break;
        case QuestionType.dateAndTime:
          questions.add(DateAndTimeQuestion.fromJson(map));
          break;
      }
    }

    List<Reward> rewards = [];
    var rewardMaps = json['rewards'];
    for (var map in rewardMaps) {
      switch (map['type']) {
        case SurveyRewardType.itemDiscount:
          rewards.add(ItemDiscountReward.fromJson(map));
          break;
        case SurveyRewardType.freeItem:
          rewards.add(FreeItemReward.fromJson(map));
          break;
      }
    }

    return Survey(
      id: json['id'],
      userId: json['userId'],
      companyId: json['companyId'],
      version: json['version'],
      name: json['name'],
      description: json['description'],
      startDate: Util.getDateTimeBySecondsTimeStamp(
        json['startDate'] as int,
      ),
      endDate: Util.getDateTimeBySecondsTimeStamp(
        json['endDate'] as int,
      ),
      createdDate: Util.getDateTimeBySecondsTimeStamp(
        json['createdDate'] as int,
      ),
      lastModifiedDate: Util.getDateTimeBySecondsTimeStamp(
        json['lastModifiedDate'] as int,
      ),
      rewards: rewards,
      rewardExpirationDate: Util.getDateTimeBySecondsTimeStamp(
        json['rewardExpirationDate'] as int,
      ),
      rewardVariant: SurveyRewardVariantType.values.contains(
              // ignore: iterable_contains_unrelated_type
              (element) => element.toString() == json['rewardVariant'])
          ? SurveyRewardVariantType.values
              .where((element) => element.toString() == json['rewardVariant'])
              .first
          : SurveyRewardVariantType.first,
      questions: questions,
      questionsAreInFixedOrder: json['questionAreInFixedOrder'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        companyId,
        version,
        name,
        description,
        startDate,
        endDate,
        createdDate,
        lastModifiedDate,
        rewards,
        rewardExpirationDate,
        rewardVariant,
        questions,
        questionsAreInFixedOrder,
      ];
}
