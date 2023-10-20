import 'package:equatable/equatable.dart';
import 'package:gasta_core/gasta_core.dart';

import 'models.dart';

class Coupon extends Equatable {
  final String id;
  final String surveyId;
  final DateTime expiringDate;
  final Reward reward;
  final CompanyInfo companyInfo;

  const Coupon(
      {required this.id,
      required this.surveyId,
      required this.expiringDate,
      required this.reward,
      required this.companyInfo});

  Coupon copyWith({
    String? id,
    String? surveyId,
    DateTime? expiringDate,
    Reward? reward,
    CompanyInfo? companyInfo,
  }) {
    return Coupon(
      id: id ?? this.id,
      surveyId: surveyId ?? this.surveyId,
      expiringDate: expiringDate ?? this.expiringDate,
      reward: reward ?? this.reward,
      companyInfo: companyInfo ?? this.companyInfo,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'surveyId': surveyId,
      'expiringDate': Util.getSecondsTimeStampByDateTime(expiringDate),
      'reward': reward.toJson(),
      'companyInfo': companyInfo.toJson(),
    };
  }

  static fromJson(Map<String, dynamic> json) {
    Reward? reward;
    switch (SurveyRewardType.values
        .where((element) => element.toString() == json['reward']['type'])
        .first) {
      case SurveyRewardType.itemDiscount:
        reward = ItemDiscountReward.fromJson(json['reward']);
        break;
      case SurveyRewardType.freeItem:
        reward = FreeItemReward.fromJson(json['reward']);
        break;
      default:
        break;
    }

    return Coupon(
      id: json['id'],
      surveyId: json['surveyId'],
      expiringDate: Util.getDateTimeBySecondsTimeStamp(
        json['expiringDate'] as int,
      ),
      reward: reward!,
      companyInfo: CompanyInfo.fromJson(json['companyInfo']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        surveyId,
        expiringDate,
        reward,
        companyInfo,
      ];
}
