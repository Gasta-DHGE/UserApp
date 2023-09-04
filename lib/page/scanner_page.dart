import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/controller/scanner_page_controller.dart';
import 'package:gasta_user_app/services/mapping_service.dart';
import 'package:gasta_user_app/utility/observer.dart';
import 'package:gasta_user_app/page/pages.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../models/models.dart';

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
      for (int i = 0; i < controller.survey.value!.questions.length; i++) {
        controller.surveyAnswer.answers.add(
          core.QuestionAnswerEntity(
            id: "",
            type: controller.survey.value!.questions[i].type,
            content: List.empty(growable: true),
          ),
        );
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
              : Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: QRView(
                          key: GlobalKey(),
                          onQRViewCreated: (value) => {},
                          overlay: QrScannerOverlayShape(
                            borderColor: Theme.of(context).colorScheme.primary,
                            borderRadius: 10,
                            borderLength: 20,
                            borderWidth: 10,
                          ),
                        ),
                      ),
                      MaterialButton(
                          child: const Text("Load Survey"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SurveyPage(
                                          survey: controller.survey.value!,
                                          onSavePressed: (value) {
                                            controller.surveyAnswer =
                                                MappingService.map<SurveyAnswer,
                                                        core.SurveyAnswerModel>(
                                                    value);
                                          },
                                          onSendPressed: (value) {
                                            controller.surveyAnswer =
                                                MappingService.map<SurveyAnswer,
                                                        core.SurveyAnswerModel>(
                                                    value);
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DebugPage(
                                                    data: controller
                                                        .surveyAnswer),
                                              ),
                                            );
                                          },
                                          onValueChanged: (value) {
                                            controller.surveyAnswer =
                                                MappingService.map<SurveyAnswer,
                                                        core.SurveyAnswerModel>(
                                                    value);
                                          },
                                        )));
                          }),
                    ],
                  ),
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
