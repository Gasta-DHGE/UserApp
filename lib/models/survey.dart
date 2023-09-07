import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/models/question.dart';

class Survey {
  String id;
  String userId;
  String companyId;
  int version;
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  DateTime createdDate;
  DateTime lastModifiedDate;
  List<Question> questions;

  Survey({
    required this.id,
    required this.userId,
    required this.companyId,
    required this.version,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.createdDate,
    required this.lastModifiedDate,
    required this.questions,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> questionMaps = [];
    for (var question in questions) {
      questionMaps.add(question.toJson());
    }

    return {
      'id': id,
      'userId': userId,
      'companyId': companyId,
      'version': version,
      'name': name,
      'description': description,
      'startDate': Util.getSecondsTimeStampByDateTime(startDate),
      'endDate': Util.getSecondsTimeStampByDateTime(endDate),
      'createdDate': Util.getSecondsTimeStampByDateTime(createdDate),
      'lastModifiedDate': Util.getSecondsTimeStampByDateTime(lastModifiedDate),
      'questions': questionMaps,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    List<Question> questions = [];
    var questionMaps = json['questions'];
    for (var map in questionMaps) {
      questions.add(Question.fromJson(map));
    }

    return Survey(
      id: json['id'],
      userId: json['userId'],
      companyId: json['companyId'],
      version: json['version'],
      name: json['name'],
      description: json['description'],
      startDate: Util.getDateTimeBySecondsTimeStamp(
        json['startDate'] as int,
      ),
      endDate: Util.getDateTimeBySecondsTimeStamp(
        json['startDate'] as int,
      ),
      createdDate: Util.getDateTimeBySecondsTimeStamp(
        json['startDate'] as int,
      ),
      lastModifiedDate: Util.getDateTimeBySecondsTimeStamp(
        json['startDate'] as int,
      ),
      questions: questions,
    );
  }
}
