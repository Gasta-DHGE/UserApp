import 'package:flutter/material.dart';
import 'package:gasta_user_app/models/models.dart';

// ignore: must_be_immutable
class SavedSurveyTile extends StatelessWidget {
  SurveyData survey;
  SavedSurveyTile({super.key, required this.survey});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: GlobalKey(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(survey.survey.description),
        ),
      ),
    );
  }
}
