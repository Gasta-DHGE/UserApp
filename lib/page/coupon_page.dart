import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/controller/controller.dart';
import 'package:gasta_user_app/widgets/saved_survey_tile.dart';

import '../models/models.dart';

// ignore: must_be_immutable
class CouponPage extends StatefulWidget {
  CouponPageController controller;
  CouponPage({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _CouponPage();
}

class _CouponPage extends State<CouponPage> {
  List<SavedSurveyTile> get savedSurveyTiles {
    List<SavedSurveyTile> ret = [];
    for (var survey in widget.controller.savedServices.value) {
      ret.add(SavedSurveyTile(survey: survey));
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.controller.savedServices,
        builder: (BuildContext context, List<SurveyData> value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Coupons",
                  style: TextStyles.bigHeadlineTextStyle(context),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => widget.controller.loadSavedServicesAsync(),
                    child: ListView(
                      children: savedSurveyTiles,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
