import 'package:flutter/material.dart';
import 'package:gasta_user_app/models/models.dart';
import 'package:gasta_user_app/services/i_save_service.dart';

class CouponPageController {
  final ISaveService saveService;

  CouponPageController({required this.saveService}) {
    loadSavedServicesAsync();
  }

  var savedSurveys = ValueNotifier<List<SurveyData>>([]);

  Future loadSavedServicesAsync() async {
    savedSurveys.value = await saveService.loadSurveysAsync();
  }
}
