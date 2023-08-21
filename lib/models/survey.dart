import 'package:gastas_user_app/models/question.dart';

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
}
