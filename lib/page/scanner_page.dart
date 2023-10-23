import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/bloc/scanner/scanner_bloc.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/models/survey/survey_data.dart';
import 'package:gasta_user_app/page/survey_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _ScannerPage();
}

class _ScannerPage extends State<ScannerPage> {
  // ignore: unused_field
  static QRViewController? qrViewController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Scan QR-Code",
            style: core.Styles.bigHeadlineTextStyle(context),
          ),
        ),
        BlocBuilder<ScannerBloc, ScannerState>(
          builder: (context, state) {
            if (state is ScannerLoading) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is ScannerScanning) {
              return Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context).colorScheme.background,
                              Colors.transparent,
                            ],
                            stops: const [0, 0.1],
                          ),
                        ),
                        child: QRView(
                          key: GlobalKey(),
                          onQRViewCreated: _onQRViewCreated,
                          overlay: QrScannerOverlayShape(
                            borderColor: Theme.of(context).colorScheme.primary,
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
                          context.read<ScannerBloc>().add(
                                LoadSurvey(
                                    userId: DependencyProvider.instance
                                        .authenticationService.firebaseUser.uid,
                                    surveyId: 'WLckqm0wxVQHC88wTzl4'),
                              );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is ScannerScanned) {
              var bloc = context.read<ScannerBloc>();
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SurveyPage(
                    survey: state.survey,
                    onSavePressed: (value) async {
                      DependencyProvider.instance.saveService.saveSurveyAsync(
                          DependencyProvider
                              .instance.authenticationService.firebaseUser.uid,
                          SurveyData(survey: state.survey, answer: value));
                      Navigator.pop(context);
                      bloc.add(RefreshScanner());
                    },
                    onSendPressed: (value) {
                      bloc.add(
                        SendSurvey(
                          userId: DependencyProvider
                              .instance.authenticationService.firebaseUser.uid,
                          answer: value,
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),
                ));
              });

              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return const Text('Something went wrong.');
          },
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        context.read<ScannerBloc>().add(
              LoadSurvey(
                  userId: DependencyProvider
                      .instance.authenticationService.firebaseUser.uid,
                  surveyId: scanData.code ?? ''),
            );
      },
    );
  }
}
