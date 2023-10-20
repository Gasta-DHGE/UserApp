import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class TimeQuestionAnswer extends QuestionAnswer {
  final TimeOfDay time;
  final int timeSpent;

  const TimeQuestionAnswer(
      {required super.id,
      required super.type,
      required this.time,
      required this.timeSpent});

  @override
  TimeQuestionAnswer copyWith({
    String? id,
    QuestionType? type,
    TimeOfDay? time,
    int? timeSpent,
  }) {
    return TimeQuestionAnswer(
      id: id ?? this.id,
      type: type ?? this.type,
      time: time ?? this.time,
      timeSpent: timeSpent ?? this.timeSpent,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'time': Util.getSecondsTimeStampByDateTime(
        DateTime(0, 0, 0, time.hour, time.minute),
      ),
      'timeSpent': timeSpent,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return TimeQuestionAnswer(
      id: json['id'],
      type: QuestionType.values
          .where((element) => element.name == json['type'])
          .first,
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
        time,
        timeSpent,
      ];
}
