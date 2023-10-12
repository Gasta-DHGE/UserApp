import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class TimeQuestionAnswer extends QuestionAnswer {
  int hour;
  int minute;
  int timeSpent;

  TimeQuestionAnswer(
      {required super.id,
      required super.type,
      required this.hour,
      required this.minute,
      required this.timeSpent});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toString(),
      'hour': hour,
      'minute': minute,
      'timeSpent': timeSpent,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return TimeQuestionAnswer(
      id: json['id'],
      type: QuestionType.values
          .where((element) => element.toString() == json['type'])
          .first,
      hour: json['hour'],
      minute: json['minute'],
      timeSpent: json['timeSpent'],
    );
  }
}
