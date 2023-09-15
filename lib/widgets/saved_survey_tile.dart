import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/models/models.dart';
import 'package:gasta_user_app/services/mapping_service.dart';
import 'package:uuid/uuid.dart';

import '../controller/controller.dart';
import '../dependency_provider.dart';
import '../page/pages.dart';

// ignore: must_be_immutable
class SavedSurveyTile extends StatelessWidget {
  SurveyData survey;
  SavedSurveyTile({super.key, required this.survey});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: FloatingActionButton.extended(
        heroTag: const Uuid().v1(),
        label: Text(survey.survey.name),
        backgroundColor: Theme.of(context).colorScheme.surface,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SurveyPage(
                controller: SurveyPageController(),
                survey: survey.survey,
                answer: survey.answer,
                onSavePressed: (value) async {
                  survey.answer = value;
                  DependencyProvider.instance.saveService.saveSurveyAsync(
                      SurveyData(survey: survey.survey, answer: value));
                  Navigator.pop(context);
                },
                onSendPressed: (value) {
                  survey.answer = value;
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DebugPage(
                        data: MappingService.map<SurveyAnswer,
                            core.SurveyAnswerModel>(survey.answer),
                      ),
                    ),
                  );
                },
                onValueChanged: (value) {
                  survey.answer = value;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
