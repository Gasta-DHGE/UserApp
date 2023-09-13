import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/controller/controller.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/services/mapping_service.dart';
import 'package:gasta_user_app/page/pages.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../models/models.dart';

// ignore: must_be_immutable
class ScannerPage extends StatefulWidget {
  ScannerPageController controller;
  ScannerPage({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _ScannerPage();
}

class _ScannerPage extends State<ScannerPage> {
  // ignore: unused_field
  static QRViewController? qrViewController;

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Scanner",
            style: core.TextStyles.bigHeadlineTextStyle(context),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: widget.controller.isLoading,
          builder: (context, value, child) {
            return Expanded(
              child: widget.controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      children: [
                        Positioned(
                          child: Container(
                            foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Theme.of(context).colorScheme.background,
                                  Colors.transparent
                                ],
                                stops: const [0, 0.1],
                              ),
                            ),
                            child: QRView(
                              key: GlobalKey(),
                              onQRViewCreated: _onQRViewCreated,
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
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            child: const Text("Simulate QR scanned"),
                            onPressed: () {
                              setState(
                                () {
                                  _onDataReceivedAsync('8Jm8NM7DaMPRe0gDYfNK');
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            );
          },
        )
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        setState(
          () {
            _onDataReceivedAsync(scanData.code ?? '');
          },
        );
      },
    );
  }

  Future _onDataReceivedAsync(String data) async {
    if (widget.controller.surveyLoaded == true) return;
    widget.controller.isLoading.value = true;
    widget.controller.surveyLoaded = true;

    var valid = await widget.controller.onDataReceivedAsync(data);
    if (valid == false) {
      widget.controller.isLoading.value = false;

      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text("No Survey found"),
              content: Text("Survey could not be loaded"),
            );
          });
      widget.controller.surveyLoaded = false;

      return;
    }

    _openSurveyPage();
    widget.controller.isLoading.value = false;
  }

  void _openSurveyPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SurveyPage(
          controller: SurveyPageController(),
          survey: widget.controller.survey!,
          onSavePressed: (value) async {
            widget.controller.surveyAnswer =
                MappingService.map<SurveyAnswer, core.SurveyAnswerModel>(value);
            DependencyProvider.instance.saveService.saveSurveyAsync(
                SurveyData(survey: widget.controller.survey!, answer: value));
            Navigator.pop(context);
            widget.controller.surveyLoaded = false;
          },
          onSendPressed: (value) {
            widget.controller.surveyAnswer =
                MappingService.map<SurveyAnswer, core.SurveyAnswerModel>(value);
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DebugPage(data: widget.controller.surveyAnswer),
              ),
            );
            widget.controller.surveyLoaded = false;
          },
          onValueChanged: (value) {
            widget.controller.surveyAnswer =
                MappingService.map<SurveyAnswer, core.SurveyAnswerModel>(value);
          },
        ),
      ),
    );
  }
}
