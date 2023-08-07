import 'package:flutter/material.dart';
import 'package:gastas_core/src/ui/general/text_styles.dart';
import 'package:gastas_core/src/models/survey/survey_item_answer.dart';
import 'package:gastas_core/src/ui/pages/survey/survey_page.dart';
import 'package:gastas_user_app/controller/scanner_page_controller.dart';
import 'package:gastas_user_app/utility/observer.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _ScannerPage();
}

class _ScannerPage extends State<ScannerPage> implements Observer {
  static ScannerPageController controller = ScannerPageController();

  _ScannerPage() {
    controller.isLoading.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    if (controller.survey.value != null) {
      controller.surveyAnswer.surveyId = controller.survey.value!.surveyId;
      for (int i = 0; i < controller.survey.value!.surveyItems.length; i++) {
        controller.surveyAnswer.surveyItemAnswers.add(SurveyItemAnswer(
          questionId: controller.survey.value!.surveyItems[i].questionId,
          type: controller.survey.value!.surveyItems[i].type,
        ));
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(children: [
            Text(
              "Scanner",
              style: TextStyles.bigHeadlineTextStyle(context),
            ),
          ]),
          controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    MaterialButton(
                        child: const Text("Start Survey"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SurveyPage(
                                        context: context,
                                        survey: controller.survey.value!,
                                        surveyAnswer: controller.surveyAnswer,
                                      )));
                        }),
                    Text("SurveyId: " + controller.surveyAnswer.surveyId),
                    Text("Answer Question 1: " +
                        controller.surveyAnswer.surveyItemAnswers[0].data
                            .toString()),
                    Text("Answer Question 2: " +
                        controller.surveyAnswer.surveyItemAnswers[1].data
                            .toString()),
                    MaterialButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text("refresh"),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.isLoading.removeObserver(this);
    super.dispose();
  }

  @override
  void onNotify(value) {
    setState(() {});
  }
}
