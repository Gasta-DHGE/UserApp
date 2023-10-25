// ignore_for_file: unused_import

import 'package:gasta_user_app/services/test_authentication_service.dart';
import 'package:gasta_user_app/services/test_survey_service.dart';

import 'services/services.dart';

class DependencyProvider {
  DependencyProvider._() {
    _surveyService = SurveyService();
    _saveService = SaveService();
    _userService = UserService();
    _couponService = CouponService();
    _authenticationService = AuthenticationService(userService: _userService);
  }

  static DependencyProvider? _instance;
  static DependencyProvider get instance {
    if (_instance == null) {
      _instance = DependencyProvider._();
      return _instance!;
    } else {
      return _instance!;
    }
  }

  late IAuthenticationService _authenticationService;
  IAuthenticationService get authenticationService => _authenticationService;

  late IUserService _userService;
  IUserService get userService => _userService;

  late ICouponService _couponService;
  ICouponService get couponService => _couponService;

  late ISurveyService _surveyService;
  ISurveyService get surveyService => _surveyService;

  late ISaveService _saveService;
  ISaveService get saveService => _saveService;
}
