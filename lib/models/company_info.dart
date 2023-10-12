import 'models.dart';

class CompanyInfo {
  String name;
  Address address;
  Map<DayOfWeek, OpeningTime> openingDays;
  String companyId;

  CompanyInfo(
      {required this.name,
      required this.address,
      required this.openingDays,
      required this.companyId});

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
