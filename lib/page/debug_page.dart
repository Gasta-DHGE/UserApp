import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/controller/controller.dart';
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
            name: 'Reward',
            description: 'testdesc',
            type: core.SurveyRewardType.freeItem,
            item: '1 Cola')
      ],
      rewardExpirationDate: DateTime.now().add(const Duration(days: 7)),
      rewardVariant: core.SurveyRewardVariantType.first,

      // ignore: prefer_const_literals_to_create_immutables
      questions: [
        const core.TextQuestionEntity(
          id: '23123123312',
          isOptional: true,
          type: core.QuestionType.text,
          title: 'What u want to say us?',
          description: 'test desc',
        ),
        const core.SingleSelectQuestionEntity(
          id: '23123126312',
          isOptional: true,
          type: core.QuestionType.select,
          title: 'What u liked the most?',
          description: 'test desc',
          options: ['Option 1', 'Option 2', 'Option 3'],
        ),
        const core.MultiSelectQuestionEntity(
          id: '23123512312',
          isOptional: true,
          type: core.QuestionType.multiSelect,
          title: 'What u liked?',
          description: 'test desc',
          options: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
        ),
        const core.NumberRatingQuestionEntity(
          id: '23123142312',
          isOptional: true,
          type: core.QuestionType.numberRating,
          title: 'How u liked us?',
          description: 'test desc',
          minRating: 0,
          maxRating: 5,
        ),
        const core.RatingTableQuestionEntity(
          id: '23123132312',
          isOptional: false,
          type: core.QuestionType.ratingTable,
          title: 'Rate pls?',
          description: 'test desc',
          ratingHeaders: ['Very Bad', 'Bad', 'Neutral', 'Good', 'Very Good'],
          ratingQuestions: [
            'How was the Service?',
            'How was the feeling?',
            'How clean it was?',
          ],
        ),
        const core.DateQuestionEntity(
          id: '23123122312',
          isOptional: true,
          type: core.QuestionType.date,
          title: 'When was your visit?',
          description: 'test desc',
        ),
        const core.TimeQuestionEntity(
          id: '23122312312',
          isOptional: true,
          type: core.QuestionType.time,
          title: 'What time u visited us?',
          description: 'test desc',
        ),
        const core.DateAndTimeQuestionEntity(
          id: '23123123312',
          isOptional: true,
          type: core.QuestionType.dateAndTime,
          title: 'When u visited us?',
          description: 'test desc',
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
                    controller: SurveyPageController(),
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
