import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_core/gasta_core.dart';

// ignore: must_be_immutable
class SurveyPage extends StatefulWidget {
  late Survey _survey;
  ValueChanged<SurveyAnswer>? _onValueChanged;
  ValueChanged<SurveyAnswer>? _onSendPressed;
  ValueChanged<SurveyAnswer>? _onSavePressed;
  SurveyPage(
      {super.key,
      required Survey survey,
      ValueChanged<SurveyAnswer>? onValueChanged,
      ValueChanged<SurveyAnswer>? onSendPressed,
      ValueChanged<SurveyAnswer>? onSavePressed}) {
    _survey = survey;
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
          survey: widget._survey,
          onValueChanged: widget._onValueChanged,
          onSendPressed: widget._onSendPressed,
          onSavePressed: widget._onSavePressed,
        ),
      ),
    );
  }
}
