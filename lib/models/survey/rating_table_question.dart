import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/models.dart';

class RatingTableQuestion extends Question {
  final List<String> ratingHeaders;
  final List<String> ratingQuestions;

  const RatingTableQuestion(
      {required super.id,
      required super.isOptional,
      required super.type,
      required super.title,
      required super.description,
      required this.ratingHeaders,
      required this.ratingQuestions});

  @override
  RatingTableQuestion copyWith(
      {String? id,
      bool? isOptional,
      QuestionType? type,
      String? title,
      String? description,
      List<String>? ratingHeaders,
      List<String>? ratingQuestions}) {
    return RatingTableQuestion(
      id: id ?? this.id,
      isOptional: isOptional ?? this.isOptional,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      ratingHeaders: ratingHeaders ?? this.ratingHeaders,
      ratingQuestions: ratingQuestions ?? this.ratingQuestions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isOptional': isOptional,
      'type': type.name,
      'title': title,
      'description': description,
      'ratingHeaders': ratingHeaders,
      'ratingQuestions': ratingQuestions,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return RatingTableQuestion(
      id: json['id'],
      isOptional: json['isOptional'],
      type: QuestionType.values
          .where((element) => element.name == json['type'])
          .first,
      title: json['title'],
      description: json['description'],
      ratingHeaders: (json['ratingHeaders'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      ratingQuestions: (json['ratingQuestions'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        isOptional,
        type,
        title,
        description,
        ratingHeaders,
        ratingQuestions,
      ];
}
