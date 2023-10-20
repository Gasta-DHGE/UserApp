import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String city;
  final String street;
  final int streetNumber;
  final String additionalInformation;
  final String postcode;
  final double posLongitude;
  final double posLatitude;

  const Address({
    required this.city,
    required this.street,
    required this.streetNumber,
    required this.additionalInformation,
    required this.postcode,
    required this.posLongitude,
    required this.posLatitude,
  });

  Address copyWith({
    String? city,
    String? street,
    int? streetNumber,
    String? additionalInformation,
    String? postcode,
    double? posLongitude,
    double? posLatitude,
  }) {
    return Address(
      city: city ?? this.city,
      street: street ?? this.street,
      streetNumber: streetNumber ?? this.streetNumber,
      additionalInformation:
          additionalInformation ?? this.additionalInformation,
      postcode: postcode ?? this.postcode,
      posLongitude: posLongitude ?? this.posLongitude,
      posLatitude: posLatitude ?? this.posLatitude,
    );
  }

  static Address fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      street: json['street'],
      streetNumber: json['streetNumber'],
      additionalInformation: json['additionalInformation'],
      postcode: json['postcode'],
      posLongitude: json['posLongitude'],
      posLatitude: json['posLatitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'street': street,
      'streetNumber': streetNumber,
      'additionalInformation': additionalInformation,
      'postcode': postcode,
      'posLongitude': posLongitude,
      'posLatitude': posLatitude,
    };
  }

  @override
  List<Object?> get props => [
        city,
        street,
        streetNumber,
        additionalInformation,
        postcode,
        posLongitude,
        posLatitude,
      ];
}
