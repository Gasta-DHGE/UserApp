import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gastas_user_app/controller/scanner_page_controller.dart';
import 'package:gastas_user_app/utility/observer.dart';
import 'package:gastas_user_app/page/pages.dart';

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
      controller.surveyAnswer.surveyId = controller.survey.value!.id;
      for (int i = 0; i < controller.survey.value!.questions.length; i++) {
        controller.surveyAnswer.surveyItemAnswers.add(core.SurveyItemAnswer(
          questionId: "",
          type: controller.survey.value!.questions[i].type.toString(),
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
              style: core.TextStyles.bigHeadlineTextStyle(context),
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
                                        survey: core.Survey(),
                                        onSavePressed: (value) {
                                          controller.surveyAnswer = value;
                                        },
                                        onSendPressed: (value) {
                                          controller.surveyAnswer = value;
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DebugPage(
                                                  data:
                                                      controller.surveyAnswer),
                                            ),
                                          );
                                        },
                                        onValueChanged: (value) {
                                          controller.surveyAnswer = value;
                                        },
                                      )));
                        }),
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
