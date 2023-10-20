import 'package:equatable/equatable.dart';
import 'package:gasta_core/gasta_core.dart';

// ignore: must_be_immutable
abstract class Reward extends Equatable {
  String name;
  String description;
  SurveyRewardType type;

  Reward({
    required this.name,
    required this.description,
    required this.type,
  });

  Map<String, dynamic> toJson();
}

// ignore: must_be_immutable
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

  static ItemDiscountReward fromJson(Map<String, dynamic> json) {
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

  @override
  List<Object?> get props => [
        name,
        description,
        type,
        discountItem,
        discount,
      ];
}

// ignore: must_be_immutable
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

  static FreeItemReward fromJson(Map<String, dynamic> json) {
    return FreeItemReward(
      name: json['name'],
      description: json['description'],
      type: SurveyRewardType.values
          .where((element) => element.toString() == json['type'])
          .first,
      item: json['item'],
    );
  }

  @override
  List<Object?> get props => [
        name,
        description,
        type,
        item,
      ];
}
