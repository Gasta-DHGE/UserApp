import 'package:gasta_core/gasta_core.dart';

import 'models.dart';

class Survey {
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
  String rewardVariant;
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
      questionMaps.add(question.toJson());
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
      'rewardVariant': rewardVariant,
      'questions': questionMaps,
      'questionAreInFixedOrder': questionsAreInFixedOrder,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    List<Question> questions = [];
    var questionMaps = json['questions'];
    for (var map in questionMaps) {
      questions.add(Question.fromJson(map));
    }

    List<Reward> rewards = [];
    var rewardMaps = json['rewards'];
    for (var map in rewardMaps) {
      rewards.add(Question.fromJson(map));
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
      rewardVariant: json['rewardVariant'],
      questions: questions,
      questionsAreInFixedOrder: json['questionAreInFixedOrder'],
    );
  }
}
