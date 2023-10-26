import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/bloc/coupons/coupons_bloc.dart';
import 'package:gasta_user_app/bloc/saved_surveys/saved_surveys_bloc.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:uuid/uuid.dart';

import '../widgets/widgets.dart';

class CouponPage extends StatefulWidget {
  const CouponPage({super.key});

  @override
  State<StatefulWidget> createState() => _CouponPage();
}

class _CouponPage extends State<CouponPage> {
  bool showSavedServices = false;

  @override
  void initState() {
    super.initState();
    context.read<SavedSurveysBloc>().add(
          LoadSavedSurveys(
            userId: DependencyProvider
                .instance.authenticationService.firebaseUser.uid,
          ),
        );
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
          Expanded(
            child: Column(
              children: [
                BlocBuilder<CouponsBloc, CouponsState>(
                  builder: (context, state) {
                    if (state is CouponsLoading) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is CouponsLoaded) {
                      return Expanded(
                        child: Center(
                          child: state.coupons.isEmpty
                              ? Text(
                                  "No Coupons :(",
                                  style: Styles.headlineTextStyle(context),
                                )
                              : RefreshIndicator(
                                  color: Theme.of(context).colorScheme.primary,
                                  onRefresh: () {
                                    context.read<CouponsBloc>().add(
                                          UpdateCoupons(
                                            userId: DependencyProvider
                                                .instance
                                                .authenticationService
                                                .firebaseUser
                                                .uid,
                                          ),
                                        );
                                    return Future(() => null);
                                  },
                                  child: ListView.separated(
                                    itemCount: state.coupons.length,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            core.OutlinedButton(
                                      onPressed: () => showDialog(
                                        context: context,
                                        builder: (context) => Coupon(
                                          coupon: state.coupons[index],
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              state.coupons[index].reward
                                                          .type ==
                                                      SurveyRewardType
                                                          .itemDiscount
                                                  ? Icons.percent
                                                  : Icons
                                                      .shopping_cart_checkout_outlined,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                state
                                                    .coupons[index].reward.name,
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
                      );
                    }
                    return const Text('Something went wrong.');
                  },
                ),
                BlocBuilder<SavedSurveysBloc, SavedSurveysState>(
                  builder: (context, state) {
                    if (state is SavedSurveysLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state is SavedSurveysLoaded) {
                      return SingleChildScrollView(
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
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Saved Surveys (${state.savedSurveys.length})",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary)),
                                );
                              },
                              body: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.savedSurveys.length,
                                itemBuilder: (context, index) {
                                  return Dismissible(
                                    key: Key(const Uuid().v1()),
                                    background: Container(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                    onDismissed: (direction) async {
                                      setState(() {});
                                    },
                                    child: SavedSurveyTile(
                                      survey: state.savedSurveys[index],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return const Text('Something went wrong.');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
