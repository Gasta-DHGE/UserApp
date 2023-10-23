// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/services/services.dart';

import '../models/models.dart';
import 'pages.dart';

// ignore: must_be_immutable
class DebugPage extends StatefulWidget {
  dynamic data;
  DebugPage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _DebugPage();
}

class _DebugPage extends State<DebugPage> {
  @override
  Widget build(BuildContext context) {
    var surveyEntitiy = core.SurveyEntity(
      id: '19208301',
      userId: '12313123123',
      companyId: '09860984085',
      version: 1,
      name: 'TestSurvey',
      description: 'testdescription',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 7)),
      createdDate: DateTime.now(),
      lastModifiedDate: DateTime.now(),
      // ignore: prefer_const_literals_to_create_immutables
      rewards: [
        const core.FreeItemRewardEntity(
          name: 'Cola',
          description: 'Eine kostenlose Cola.',
          type: core.SurveyRewardType.freeItem,
          item: '1 Cola',
        ),
      ],
      rewardExpirationDate: DateTime.now().add(const Duration(days: 7)),
      rewardVariant: core.SurveyRewardVariantType.first,

      // ignore: prefer_const_literals_to_create_immutables
      questions: [
        const core.TextQuestionEntity(
          id: '23123123312',
          isOptional: true,
          type: core.QuestionType.text,
          title: 'Was können wir verbessern?',
          description: 'Ich bin eine Beschreibung.',
        ),
        const core.SingleSelectQuestionEntity(
          id: '23123126312',
          isOptional: false,
          type: core.QuestionType.select,
          title: 'Was hat dir bei deinem Besuch am besten gefallen?',
          description: 'Ich bin eine Beschreibung.',
          options: ['Essen', 'Kundenservice', 'Dekoration'],
        ),
        const core.MultiSelectQuestionEntity(
          id: '23123512312',
          isOptional: true,
          type: core.QuestionType.multiSelect,
          title: 'Was sollten wir besser machen?',
          description: 'Ich bin eine Beschreibung.',
          options: ['Essen', 'Kundenservice', 'Dekoration', 'Essensauswahl'],
        ),
        const core.NumberRatingQuestionEntity(
          id: '23123142312',
          isOptional: false,
          type: core.QuestionType.numberRating,
          title: 'Wie würden Sie uns bewerten?',
          description: 'Ich bin eine Beschreibung.',
          minRating: 0,
          maxRating: 5,
        ),
        const core.RatingTableQuestionEntity(
          id: '23123132312',
          isOptional: false,
          type: core.QuestionType.ratingTable,
          title: 'Bitte bewerten',
          description: 'Ich bin eine Beschreibung.',
          ratingHeaders: [
            'Sehr Schlecht',
            'Schlecht',
            'Neutral',
            'Gut',
            'Sehr Gut'
          ],
          ratingQuestions: [
            'Essen',
            'Essensauswahl',
            'Wartezeit',
            'Preis',
            'Kundenservice',
            'Dekoration',
          ],
        ),
        const core.DateQuestionEntity(
          id: '23123122312',
          isOptional: true,
          type: core.QuestionType.date,
          title: 'Wann war ihr Besuch?',
          description: 'Ich bin eine Beschreibung.',
        ),
        const core.TimeQuestionEntity(
          id: '23122312312',
          isOptional: true,
          type: core.QuestionType.time,
          title: 'Wie lang war ihr Besuch?',
          description: 'Ich bin eine Beschreibung.',
        ),
        const core.DateAndTimeQuestionEntity(
          id: '23123123312',
          isOptional: false,
          type: core.QuestionType.dateAndTime,
          title: 'Wann war ihr Besuch?',
          description: 'Ich bin eine Beschreibung.',
        ),
      ],
      questionsAreInFixedOrder: true,
    );

    var survey = MappingService.map<core.SurveyEntity, Survey>(surveyEntitiy);

    SurveyAnswer? surveyAnswer;
    core.SurveyAnswerEntity? surveyAnswerEntitiy;
    core.SurveyAnswerModel? surveyAnswerModel;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FloatingActionButton(
            heroTag: 'test',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SurveyPage(
                    survey: survey,
                    answer: surveyAnswer,
                    onValueChanged: (value) => surveyAnswer = value,
                    onSendPressed: (value) async {
                      surveyAnswerEntitiy = MappingService.map<SurveyAnswer,
                          core.SurveyAnswerEntity>(value);
                      surveyAnswerModel = core.SurveyAnswerModel.fromEntity(
                          surveyAnswerEntitiy!);
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
