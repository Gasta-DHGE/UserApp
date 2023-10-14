import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class TimeQuestionAnswer extends QuestionAnswer {
  TimeOfDay time;
  int timeSpent;

  TimeQuestionAnswer(
      {required super.id,
      required super.type,
      required this.time,
      required this.timeSpent});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toString(),
      'time': time,
      'timeSpent': timeSpent,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return TimeQuestionAnswer(
      id: json['id'],
      type: QuestionType.values
          .where((element) => element.toString() == json['type'])
          .first,
      time: json['time'],
      timeSpent: json['timeSpent'],
    );
  }
}
