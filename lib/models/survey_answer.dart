import 'models.dart';

class SurveyAnswer {
  final String id;
  final int version;
  final List<QuestionAnswer> answers;

  SurveyAnswer({
    required this.id,
    required this.answers,
    required this.version,
  });
}
