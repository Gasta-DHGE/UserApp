import 'package:equatable/equatable.dart';
import 'package:gasta_core/gasta_core.dart';

// ignore: must_be_immutable
class OpeningTime extends Equatable {
  bool isOpen;
  DateTime from;
  DateTime to;

  OpeningTime({
    required this.isOpen,
    required this.from,
    required this.to,
  });

  Map<String, dynamic> toJson() {
    return {
      'isOpen': isOpen,
      'from': Util.getSecondsTimeStampByDateTime(from),
      'to': Util.getSecondsTimeStampByDateTime(to),
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return OpeningTime(
      isOpen: json['isOpen'],
      from: Util.getDateTimeBySecondsTimeStamp(
        json['from'] as int,
      ),
      to: Util.getDateTimeBySecondsTimeStamp(
        json['to'] as int,
      ),
    );
  }

  @override
  List<Object?> get props => [
        isOpen,
        from,
        to,
      ];
}
