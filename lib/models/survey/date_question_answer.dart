import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class DateQuestionAnswer extends QuestionAnswer {
  DateTime date;

  DateQuestionAnswer(
      {required super.id, required super.type, required this.date});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toString(),
      'date': Util.getSecondsTimeStampByDateTime(date),
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return DateQuestionAnswer(
        id: json['id'],
        type: QuestionType.values
            .where((element) => element.toString() == json['type'])
            .first,
        date: Util.getDateTimeBySecondsTimeStamp(json['date']));
  }
}
