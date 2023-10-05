class Address {
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
}
