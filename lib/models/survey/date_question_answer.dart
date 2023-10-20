import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class DateQuestionAnswer extends QuestionAnswer {
  final DateTime date;

  const DateQuestionAnswer(
      {required super.id, required super.type, required this.date});

  @override
  DateQuestionAnswer copyWith({
    String? id,
    QuestionType? type,
    DateTime? date,
  }) {
    return DateQuestionAnswer(
      id: id ?? this.id,
      type: type ?? this.type,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'date': Util.getSecondsTimeStampByDateTime(date),
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return DateQuestionAnswer(
        id: json['id'],
        type: QuestionType.values
            .where((element) => element.name == json['type'])
            .first,
        date: Util.getDateTimeBySecondsTimeStamp(json['date']));
  }

  @override
  List<Object?> get props => [
        id,
        type,
        date,
      ];
}
