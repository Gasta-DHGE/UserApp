import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/controller/controller.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/services/mapping_service.dart';
import 'package:gasta_user_app/page/pages.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

// ignore: must_be_immutable
class ScannerPage extends StatefulWidget {
  ScannerPageController controller;
  ScannerPage({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _ScannerPage();
}

class _ScannerPage extends State<ScannerPage> {
  QRViewController? qrViewController;

  @override
  Widget build(BuildContext context) {
    if (widget.controller.survey != null) {
      for (int i = 0; i < widget.controller.survey!.questions.length; i++) {
        widget.controller.surveyAnswer.answers.add(
          core.QuestionAnswerEntity(
            id: "",
            type: widget.controller.survey!.questions[i].type,
            content: List.empty(growable: true),
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Scanner",
                style: core.TextStyles.bigHeadlineTextStyle(context),
              ),
            ],
          ),
          widget.controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: FadeBorder(
                          child: QRView(
                            key: GlobalKey(),
                            onQRViewCreated: _onQRViewCreated,
                            onPermissionSet: (p0, p1) =>
                                {_onPermissionSet(context, p0, p1)},
                            overlay: QrScannerOverlayShape(
                              borderColor:
                                  Theme.of(context).colorScheme.primary,
                              borderRadius: 10,
                              borderLength: 20,
                              borderWidth: 10,
                            ),
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
                                          controller: SurveyPageController(),
                                          survey: widget.controller.survey!,
                                          onSavePressed: (value) async {
                                            widget.controller.surveyAnswer =
                                                MappingService.map<
                                                    SurveyAnswer,
                                                    core
                                                    .SurveyAnswerModel>(value);
                                            DependencyProvider
                                                .instance.saveService
                                                .saveSurveyAsync(SurveyData(
                                                    survey: widget
                                                        .controller.survey!,
                                                    answer: value));
                                          },
                                          onSendPressed: (value) {
                                            widget.controller.surveyAnswer =
                                                MappingService.map<
                                                    SurveyAnswer,
                                                    core
                                                    .SurveyAnswerModel>(value);
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DebugPage(
                                                    data: widget.controller
                                                        .surveyAnswer),
                                              ),
                                            );
                                          },
                                          onValueChanged: (value) {
                                            widget.controller.surveyAnswer =
                                                MappingService.map<
                                                    SurveyAnswer,
                                                    core
                                                    .SurveyAnswerModel>(value);
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

  void _onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        widget.controller.onDataReceivedAsync(scanData.code ?? "");
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
