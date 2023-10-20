import 'package:equatable/equatable.dart';
import 'package:gasta_core/gasta_core.dart';

abstract class Reward extends Equatable {
  final String name;
  final String description;
  final SurveyRewardType type;

  const Reward({
    required this.name,
    required this.description,
    required this.type,
  });

  Reward copyWith({
    String? name,
    String? description,
    SurveyRewardType? type,
  });

  Map<String, dynamic> toJson();
}

class ItemDiscountReward extends Reward {
  final String discountItem;
  final double discount;

  const ItemDiscountReward({
    required super.name,
    required super.description,
    required super.type,
    required this.discountItem,
    required this.discount,
  });

  @override
  ItemDiscountReward copyWith({
    String? name,
    String? description,
    SurveyRewardType? type,
    String? discountItem,
    double? discount,
  }) {
    return ItemDiscountReward(
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      discountItem: discountItem ?? this.discountItem,
      discount: discount ?? this.discount,
    );
  }

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

class FreeItemReward extends Reward {
  final String item;

  const FreeItemReward({
    required super.name,
    required super.description,
    required super.type,
    required this.item,
  });

  @override
  FreeItemReward copyWith({
    String? name,
    String? description,
    SurveyRewardType? type,
    String? item,
  }) {
    return FreeItemReward(
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      item: item ?? this.item,
    );
  }

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
