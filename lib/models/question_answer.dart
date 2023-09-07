import 'package:gasta_core/gasta_core.dart';

class QuestionAnswer {
  String id;
  QuestionType type;
  List<dynamic> content;

  QuestionAnswer({required this.id, required this.type, required this.content});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toString(),
      'content': content,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return QuestionAnswer(
      id: json['id'],
      type: QuestionType.values
          .where((element) => element.toString() == json['type'])
          .first,
      content: json['content'],
    );
  }
}
