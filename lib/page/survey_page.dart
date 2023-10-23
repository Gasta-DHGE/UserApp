import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/services/mapping_service.dart';

import '../models/models.dart';

// ignore: must_be_immutable
class SurveyPage extends StatefulWidget {
  late Survey _survey;
  SurveyAnswer? _answer;
  ValueChanged<SurveyAnswer>? _onValueChanged;
  ValueChanged<SurveyAnswer>? _onSendPressed;
  ValueChanged<SurveyAnswer>? _onSavePressed;
  SurveyPage(
      {super.key,
      required Survey survey,
      SurveyAnswer? answer,
      ValueChanged<SurveyAnswer>? onValueChanged,
      ValueChanged<SurveyAnswer>? onSendPressed,
      ValueChanged<SurveyAnswer>? onSavePressed}) {
    _survey = survey;
    _answer = answer;
    _onValueChanged = onValueChanged;
    _onSendPressed = onSendPressed;
    _onSavePressed = onSavePressed;
  }

  @override
  State<StatefulWidget> createState() => _SurveyPage();
}

class _SurveyPage extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: core.SurveyPage(
          survey: MappingService.map<Survey, core.SurveyModel>(widget._survey),
          answer: widget._answer != null
              ? MappingService.map<SurveyAnswer, core.SurveyAnswerModel>(
                  widget._answer!)
              : null,
          onValueChanged: (value) {
            widget._onValueChanged?.call(
                MappingService.map<core.SurveyAnswerModel, SurveyAnswer>(
                    core.SurveyAnswerModel.fromEntity(value)));
          },
          onSendPressed: (value) {
            widget._onSendPressed?.call(
                MappingService.map<core.SurveyAnswerModel, SurveyAnswer>(
                    core.SurveyAnswerModel.fromEntity(value)));
          },
          onSavePressed: (value) {
            widget._onSavePressed?.call(
                MappingService.map<core.SurveyAnswerModel, SurveyAnswer>(
                    core.SurveyAnswerModel.fromEntity(value)));
          },
        ),
      ),
    );
  }
}
