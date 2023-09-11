import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/controller/controller.dart';
import 'package:gasta_user_app/widgets/saved_survey_tile.dart';
import 'package:uuid/uuid.dart';

import '../models/models.dart';

// ignore: must_be_immutable
class CouponPage extends StatefulWidget {
  CouponPageController controller;
  CouponPage({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _CouponPage();
}

class _CouponPage extends State<CouponPage> {
  List<Widget> get listItems {
    List<Widget> items = [];

    // coupons
    items.add(
      SizedBox(
        height: 250,
        child: Center(
          child: Text(
            "No Coupons :(",
            style: TextStyles.headlineTextStyle(context),
          ),
        ),
      ),
    );

    // saved surveys
    if (widget.controller.savedServices.value.isNotEmpty) {
      items.add(
        Text(
          "Saved Surveys",
          style: TextStyles.headlineTextStyle(context),
        ),
      );
      for (var survey in widget.controller.savedServices.value) {
        items.add(Dismissible(
          key: Key(const Uuid().v1()),
          background: Container(
            color: Theme.of(context).colorScheme.error,
          ),
          onDismissed: (direction) async {
            widget.controller.savedServices.value.removeWhere(
                (element) => element.survey.id == survey.survey.id);
            widget.controller.saveService.removeSurvey(survey.survey.id);
            setState(() {});
          },
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: SavedSurveyTile(
              survey: survey,
            ),
          ),
        ));
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Coupons",
            style: TextStyles.bigHeadlineTextStyle(context),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => widget.controller.loadSavedServicesAsync(),
              child: ValueListenableBuilder(
                valueListenable: widget.controller.savedServices,
                builder: (BuildContext context, List<SurveyData> value,
                    Widget? child) {
                  return ListView(
                    children: listItems,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
