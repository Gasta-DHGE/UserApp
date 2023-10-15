import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/controller/controller.dart';
import 'package:uuid/uuid.dart';

import '../widgets/widgets.dart';

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
          ListenableBuilder(
            listenable: widget.controller,
            builder: (BuildContext context, Widget? child) {
              return Visibility(
                visible: !showSavedServices ||
                    widget.controller.savedSurveys.isEmpty,
                child: Expanded(
                  child: GestureDetector(
                    onTap: () {
                      widget.controller.loadSavedServicesAsync();
                      widget.controller.loadCouponsAsync();
                    },
                    child: Center(
                      child: widget.controller.coupons.isEmpty
                          ? Text(
                              "No Coupons :(",
                              style: Styles.headlineTextStyle(context),
                            )
                          : RefreshIndicator(
                              color: Theme.of(context).colorScheme.primary,
                              onRefresh: () {
                                widget.controller.loadCouponsAsync();
                                widget.controller.loadSavedServicesAsync();
                                return Future(() => null);
                              },
                              child: ListView.separated(
                                itemCount: widget.controller.coupons.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        core.OutlinedButton(
                                  onPressed: () => showDialog(
                                    context: context,
                                    builder: (context) => Coupon(
                                      coupon: widget.controller.coupons[index],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          widget.controller.coupons[index]
                                                      .reward.type ==
                                                  SurveyRewardType.itemDiscount
                                              ? Icons.percent
                                              : Icons
                                                  .shopping_cart_checkout_outlined,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            widget.controller.coupons[index]
                                                .reward.name,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Padding(
                                  padding: EdgeInsets.all(4.0),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              );
            },
          ),
          ListenableBuilder(
            listenable: widget.controller,
            builder: (BuildContext context, Widget? child) {
              return Visibility(
                visible: widget.controller.savedSurveys.isNotEmpty,
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
                                "Saved Surveys (${widget.controller.savedSurveys.length})",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                          );
                        },
                        body: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.controller.savedSurveys.length,
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
                                    widget.controller.savedSurveys[index].survey
                                        .id);
                                widget.controller.savedSurveys.removeWhere(
                                    (element) =>
                                        element.survey.id ==
                                        widget.controller.savedSurveys[index]
                                            .survey.id);
                                setState(() {});
                              },
                              child: SavedSurveyTile(
                                survey: widget.controller.savedSurveys[index],
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
