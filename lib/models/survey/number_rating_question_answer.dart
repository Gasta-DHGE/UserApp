import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class NumberRatingQuestionAnswer extends QuestionAnswer {
  final int ratedNumber;

  const NumberRatingQuestionAnswer(
      {required super.id, required super.type, required this.ratedNumber});

  @override
  NumberRatingQuestionAnswer copyWith({
    String? id,
    QuestionType? type,
    int? ratedNumber,
  }) {
    return NumberRatingQuestionAnswer(
      id: id ?? this.id,
      type: type ?? this.type,
      ratedNumber: ratedNumber ?? this.ratedNumber,
    );
  }

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
