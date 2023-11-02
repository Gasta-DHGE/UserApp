import 'package:flutter/material.dart';
import 'package:gasta_user_app/models/models.dart';
import 'package:uuid/uuid.dart';

import '../dependency_provider.dart';
import '../page/pages.dart';

// ignore: must_be_immutable
class SavedSurveyTile extends StatelessWidget {
  SurveyData survey;
  Function? onClosed;
  SavedSurveyTile({super.key, required this.survey, this.onClosed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: FloatingActionButton.extended(
        elevation: 0,
        heroTag: const Uuid().v1(),
        label: Text(survey.survey.name),
        backgroundColor: Theme.of(context).colorScheme.surface,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SurveyPage(
                survey: survey.survey,
                answer: survey.answer,
                onSavePressed: (value) async {
                  survey = survey.copyWith(answer: value);
                  DependencyProvider.instance.saveService.saveSurveyAsync(
                      DependencyProvider
                          .instance.authenticationService.firebaseUser.uid,
                      SurveyData(survey: survey.survey, answer: value));
                  Navigator.pop(context);
                  if (onClosed != null) {
                    onClosed!();
                  }
                },
                onSendPressed: (value) async {
                  survey = survey.copyWith(answer: value);
                  try {
                    await DependencyProvider.instance.surveyService
                        .sendSurveyAsync(
                            DependencyProvider.instance.authenticationService
                                .firebaseUser.uid,
                            survey.answer);

                    DependencyProvider.instance.saveService.removeSurvey(
                        DependencyProvider
                            .instance.authenticationService.firebaseUser.uid,
                        survey.survey.id);
                  } catch (e) {}

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);

                  if (onClosed != null) {
                    onClosed!();
                  }
                },
                onValueChanged: (value) {
                  survey = survey.copyWith(answer: value);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
