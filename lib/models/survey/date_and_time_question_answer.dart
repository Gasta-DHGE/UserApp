import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class DateAndTimeQuestionAnswer extends QuestionAnswer {
  DateTime date;
  TimeOfDay time;
  int timeSpent;

  DateAndTimeQuestionAnswer(
      {required super.id,
      required super.type,
      required this.date,
      required this.time,
      required this.timeSpent});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'date': Util.getSecondsTimeStampByDateTime(date),
      'time': time,
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
      time: json['time'],
      timeSpent: json['timeSpent'],
    );
  }
}
