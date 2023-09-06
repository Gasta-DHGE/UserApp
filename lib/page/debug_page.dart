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
        Text("Text: " +
            (widget.data as SurveyAnswerModel).answers[0].content[0]),
        Text("Selected Index: " +
            (widget.data as SurveyAnswerModel)
                .answers[1]
                .content[0]
                .toString()),
        Text(
          "Selected Indexes length: " +
              (widget.data as SurveyAnswerModel).answers[2].content.toString(),
        ),
      ]),
    );
  }
}
