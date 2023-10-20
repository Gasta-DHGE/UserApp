import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

// ignore: must_be_immutable
class NumberRatingQuestionAnswer extends QuestionAnswer {
  int ratedNumber;

  NumberRatingQuestionAnswer(
      {required super.id, required super.type, required this.ratedNumber});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'ratedNumber': ratedNumber,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return NumberRatingQuestionAnswer(
      id: json['id'],
      type: QuestionType.values
          .where((element) => element.name == json['type'])
          .first,
      ratedNumber: json['ratedNumber'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        type,
        ratedNumber,
      ];
}
