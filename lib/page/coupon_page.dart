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
  @override
  void initState() {
    super.initState();
    widget.controller.loadSavedServicesAsync();
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
            child: GestureDetector(
              onTap: () => widget.controller.loadSavedServicesAsync(),
              child: Center(
                child: Text(
                  "No Coupons :(",
                  style: TextStyles.headlineTextStyle(context),
                ),
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: widget.controller.savedServices,
            builder:
                (BuildContext context, List<SurveyData> value, Widget? child) {
              return Visibility(
                visible: widget.controller.savedServices.value.isNotEmpty,
                child: Text(
                  "Saved Surveys",
                  style: TextStyles.headlineTextStyle(context),
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: widget.controller.savedServices,
            builder:
                (BuildContext context, List<SurveyData> value, Widget? child) {
              return Visibility(
                visible: widget.controller.savedServices.value.isNotEmpty,
                child: Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => widget.controller.loadSavedServicesAsync(),
                    child: ListView.builder(
                      itemCount: widget.controller.savedServices.value.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(const Uuid().v1()),
                          background: Container(
                            color: Theme.of(context).colorScheme.error,
                          ),
                          onDismissed: (direction) async {
                            widget.controller.saveService.removeSurvey(widget
                                .controller
                                .savedServices
                                .value[index]
                                .survey
                                .id);
                            widget.controller.savedServices.value.removeWhere(
                                (element) =>
                                    element.survey.id ==
                                    widget.controller.savedServices.value[index]
                                        .survey.id);
                            setState(() {});
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: SavedSurveyTile(
                              survey:
                                  widget.controller.savedServices.value[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
