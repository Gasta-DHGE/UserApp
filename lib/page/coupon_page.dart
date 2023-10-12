import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/controller/controller.dart';
import 'package:gasta_user_app/widgets/saved_survey_tile.dart';
import 'package:uuid/uuid.dart';

class CouponPage extends StatefulWidget {
  final CouponPageController controller;
  const CouponPage({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _CouponPage();
}

class _CouponPage extends State<CouponPage> {
  bool showSavedServices = false;

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
            "My Coupons",
            style: Styles.bigHeadlineTextStyle(context),
          ),
          ValueListenableBuilder(
            valueListenable: widget.controller.savedSurveys,
            builder: (BuildContext context, value, Widget? child) {
              return Visibility(
                visible: !showSavedServices ||
                    widget.controller.savedSurveys.value.isEmpty,
                child: Expanded(
                  child: GestureDetector(
                    onTap: () => widget.controller.loadSavedServicesAsync(),
                    child: Center(
                      child: Text(
                        "No Coupons :(",
                        style: Styles.headlineTextStyle(context),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: widget.controller.savedSurveys,
            builder: (BuildContext context, value, Widget? child) {
              return Visibility(
                visible: widget.controller.savedSurveys.value.isNotEmpty,
                child: SingleChildScrollView(
                  child: ExpansionPanelList(
                    elevation: 0,
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        showSavedServices = !showSavedServices;
                      });
                    },
                    children: [
                      ExpansionPanel(
                        isExpanded: showSavedServices,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "Saved Surveys (${widget.controller.savedSurveys.value.length})",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                          );
                        },
                        body: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              widget.controller.savedSurveys.value.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: Key(const Uuid().v1()),
                              background: Container(
                                color: Theme.of(context).colorScheme.error,
                              ),
                              onDismissed: (direction) async {
                                widget.controller.saveService.removeSurvey(
                                    widget.controller.authenticationService
                                        .firebaseUser.uid,
                                    widget.controller.savedSurveys.value[index]
                                        .survey.id);
                                widget.controller.savedSurveys.value
                                    .removeWhere((element) =>
                                        element.survey.id ==
                                        widget.controller.savedSurveys
                                            .value[index].survey.id);
                                setState(() {});
                              },
                              child: SavedSurveyTile(
                                survey:
                                    widget.controller.savedSurveys.value[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
