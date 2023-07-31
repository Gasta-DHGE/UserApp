import 'package:flutter/material.dart';
import 'package:gastas_core/models/survey.dart';
import 'package:gastas_core/models/survey_answer.dart';
import 'package:gastas_core/models/survey_item_answer.dart';
import 'package:gastas_core/ui/pages/survey/survey_page.dart';
import 'package:gastas_user_app/services/i_survey_service.dart';
import 'package:gastas_user_app/services/test_survey_service.dart';

class ScannerPage extends StatefulWidget {
  ScannerPage({super.key});

  SurveyAnswer surveyAnswer = SurveyAnswer();

  @override
  State<StatefulWidget> createState() => _ScannerPage();
}

class _ScannerPage extends State<ScannerPage> {
  @override
  Widget build(BuildContext context) {
    ISurveyService surveyService = TestSurveyService();
    Survey survey = surveyService.getSurvey();

    widget.surveyAnswer.surveyId = survey.surveyId;
    for (int i = 0; i < survey.surveyItems.length; i++) {
      widget.surveyAnswer.surveyItemAnswers.add(SurveyItemAnswer(
        questionId: survey.surveyItems[i].questionId,
        type: survey.surveyItems[i].type,
      ));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(children: [
            Text(
              "Scanner",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ]),
          MaterialButton(
              child: const Text("Start Survey"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SurveyPage(
                              context: context,
                              survey: survey,
                              surveyAnswer: widget.surveyAnswer,
                            )));
              }),
          Text("SurveyId: " + widget.surveyAnswer.surveyId),
          Text("Answer Question 1: " +
              widget.surveyAnswer.surveyItemAnswers[0].data.toString()),
          Text("Answer Question 2: " +
              widget.surveyAnswer.surveyItemAnswers[1].data.toString()),
          MaterialButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text("refresh"),
          ),
        ],
      ),
    );
  }
}
