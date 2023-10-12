import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class DateAndTimeQuestionAnswer extends QuestionAnswer {
  DateTime date;
  int hour;
  int minute;
  int timeSpent;

  DateAndTimeQuestionAnswer(
      {required super.id,
      required super.type,
      required this.date,
      required this.hour,
      required this.minute,
      required this.timeSpent});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toString(),
      'date': Util.getSecondsTimeStampByDateTime(date),
      'hour': hour,
      'minute': minute,
      'timeSpent': timeSpent,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return DateAndTimeQuestionAnswer(
      id: json['id'],
      type: QuestionType.values
          .where((element) => element.toString() == json['type'])
          .first,
      date: Util.getDateTimeBySecondsTimeStamp(json['date']),
      hour: json['hour'],
      minute: json['minute'],
      timeSpent: json['timeSpent'],
    );
  }
}
