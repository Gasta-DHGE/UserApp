import 'package:flutter/material.dart';
import 'package:gastas_core/models/survey.dart';
import 'package:gastas_core/ui/pages/survey/survey_page.dart';
import 'package:gastas_core/models/text_survey_item.dart';
import 'package:gastas_core/models/single_selection_survey_item.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _ScannerPage();
}

class _ScannerPage extends State<ScannerPage> {
  Survey survey = Survey(surveyItems: [
    TextSurveyItem(heading: 'What could we do better?'),
    SingleSelectionSurveyItem(
        heading: 'What could we do better?',
        options: ["Option 1", "Option 2", "Option 3", "Option 4"])
  ]);

  @override
  Widget build(BuildContext context) {
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
                            )));
              }),
        ],
      ),
    );
  }
}
