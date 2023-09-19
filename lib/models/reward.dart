import 'package:gasta_core/gasta_core.dart';

abstract class Reward {
  String name;
  String description;
  SurveyRewardType type;

  Reward({
    required this.name,
    required this.description,
    required this.type,
  });

  toJson();
}

class ItemDiscountReward extends Reward {
  String discountItem;
  double discount;

  ItemDiscountReward({
    required super.name,
    required super.description,
    required super.type,
    required this.discountItem,
    required this.discount,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'type': type.toString(),
      'discountItem': discountItem,
      'discount': discount,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return ItemDiscountReward(
      name: json['name'],
      description: json['description'],
      type: SurveyRewardType.values
          .where((element) => element.toString() == json['type'])
          .first,
      discountItem: json['discountItem'],
      discount: json['discount'],
    );
  }
}

class FreeItemReward extends Reward {
  String item;

  FreeItemReward({
    required super.name,
    required super.description,
    required super.type,
    required this.item,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'type': type.toString(),
      'item': item,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return FreeItemReward(
      name: json['name'],
      description: json['description'],
      type: SurveyRewardType.values
          .where((element) => element.toString() == json['type'])
          .first,
      item: json['item'],
    );
  }
}
