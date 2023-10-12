import 'package:flutter/material.dart';
import 'package:gasta_user_app/models/models.dart';
import 'package:gasta_user_app/services/services.dart';

class CouponPageController with ChangeNotifier {
  final ISaveService saveService;
  final ICouponService couponService;
  final IAuthenticationService authenticationService;

  CouponPageController({
    required this.authenticationService,
    required this.couponService,
    required this.saveService,
  }) {
    loadSavedServicesAsync();
    loadCouponsAsync();
  }

  List<SurveyData> _savedSurveys = [];
  List<SurveyData> get savedSurveys => _savedSurveys;
  set savedSurveys(List<SurveyData> value) {
    _savedSurveys = value;
    notifyListeners();
  }

  List<Coupon> _coupons = [];
  List<Coupon> get coupons => _coupons;
  set coupons(List<Coupon> value) {
    _coupons = value;
    notifyListeners();
  }

  Future loadSavedServicesAsync() async {
    if (!authenticationService.isLoggedIn) return;
    savedSurveys = await saveService
        .loadSurveysAsync(authenticationService.firebaseUser.uid);
  }

  Future loadCouponsAsync() async {
    if (!authenticationService.isLoggedIn) return;
    coupons = await couponService
        .getCouponByUserIdAsync(authenticationService.firebaseUser.uid);
  }
}
