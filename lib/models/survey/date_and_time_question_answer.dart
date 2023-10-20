import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class DateAndTimeQuestionAnswer extends QuestionAnswer {
  final DateTime date;
  final TimeOfDay time;
  final int timeSpent;

  const DateAndTimeQuestionAnswer(
      {required super.id,
      required super.type,
      required this.date,
      required this.time,
      required this.timeSpent});

  @override
  DateAndTimeQuestionAnswer copyWith({
    String? id,
    QuestionType? type,
    DateTime? date,
    TimeOfDay? time,
    int? timeSpent,
  }) {
    return DateAndTimeQuestionAnswer(
      id: id ?? this.id,
      type: type ?? this.type,
      date: date ?? this.date,
      time: time ?? this.time,
      timeSpent: timeSpent ?? this.timeSpent,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'date': Util.getSecondsTimeStampByDateTime(date),
      'time': Util.getSecondsTimeStampByDateTime(
        DateTime(0, 0, 0, time.hour, time.minute),
      ),
      'timeSpent': timeSpent,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return DateAndTimeQuestionAnswer(
      id: json['id'],
      type: QuestionType.values
          .where((element) => element.name == json['type'])
          .first,
      date: Util.getDateTimeBySecondsTimeStamp(json['date']),
      time: TimeOfDay.fromDateTime(
        Util.getDateTimeBySecondsTimeStamp(
          json['time'],
        ),
      ),
      timeSpent: json['timeSpent'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        type,
        date,
        time,
        timeSpent,
      ];
}
