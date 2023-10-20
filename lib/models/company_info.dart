import 'package:equatable/equatable.dart';

import 'models.dart';

class CompanyInfo extends Equatable {
  final String name;
  final Address address;
  final Map<DayOfWeek, OpeningTime> openingDays;
  final String companyId;

  const CompanyInfo(
      {required this.name,
      required this.address,
      required this.openingDays,
      required this.companyId});

  CompanyInfo copyWith({
    String? name,
    Address? address,
    Map<DayOfWeek, OpeningTime>? openingDays,
    String? companyId,
  }) {
    return CompanyInfo(
      name: name ?? this.name,
      address: address ?? this.address,
      openingDays: openingDays ?? this.openingDays,
      companyId: companyId ?? this.companyId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address.toJson(),
      'openingDays': openingDays,
      'companyId': companyId,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return CompanyInfo(
      name: json['name'],
      address: Address.fromJson(json['address']),
      openingDays: json['openingDays'],
      companyId: json['companyId'],
    );
  }

  @override
  List<Object?> get props => [
        name,
        address,
        openingDays,
        companyId,
      ];
}

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}
