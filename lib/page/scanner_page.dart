import 'package:flutter/material.dart';
import 'package:gastas_core/models/survey.dart';
import 'package:gastas_core/models/survey_answer.dart';
import 'package:gastas_core/models/survey_item_answer.dart';
import 'package:gastas_core/ui/pages/survey/survey_page.dart';
import 'package:gastas_user_app/controller/scanner_page_controller.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _ScannerPage();
}

class _ScannerPage extends State<ScannerPage> {
  static ScannerPageController controller = ScannerPageController();

  @override
  Widget build(BuildContext context) {
    controller.surveyAnswer.surveyId = controller.survey!.surveyId;
    for (int i = 0; i < controller.survey!.surveyItems.length; i++) {
      controller.surveyAnswer.surveyItemAnswers.add(SurveyItemAnswer(
        questionId: controller.survey!.surveyItems[i].questionId,
        type: controller.survey!.surveyItems[i].type,
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
                              survey: controller.survey!,
                              surveyAnswer: controller.surveyAnswer,
                            )));
              }),
          Text("SurveyId: " + controller.surveyAnswer.surveyId),
          Text("Answer Question 1: " +
              controller.surveyAnswer.surveyItemAnswers[0].data.toString()),
          Text("Answer Question 2: " +
              controller.surveyAnswer.surveyItemAnswers[1].data.toString()),
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
