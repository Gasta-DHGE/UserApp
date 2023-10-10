import 'package:flutter/material.dart';
import 'package:gasta_user_app/models/models.dart';
import 'package:gasta_user_app/services/services.dart';

class CouponPageController {
  final ISaveService saveService;
  final IAuthenticationService authenticationService;

  CouponPageController({
    required this.authenticationService,
    required this.saveService,
  }) {
    loadSavedServicesAsync();
  }

  var savedSurveys = ValueNotifier<List<SurveyData>>([]);

  Future loadSavedServicesAsync() async {
    if (authenticationService.user == null) return;
    savedSurveys.value = await saveService
        .loadSurveysAsync(authenticationService.user!.firebaseUser.uid);
  }
}
