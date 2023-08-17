import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';

// ignore: must_be_immutable
class DebugPage extends StatefulWidget {
  dynamic data;
  DebugPage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _DebugPage();
}

class _DebugPage extends State<DebugPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Text(
          (widget.data as SurveyAnswer).surveyItemAnswers[0].data.toString(),
        ),
        Text(
          (widget.data as SurveyAnswer).surveyItemAnswers[1].data.toString(),
        ),
      ]),
    );
  }
}
