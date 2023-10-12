// ignore_for_file: unused_import

import 'package:gasta_user_app/controller/controller.dart';
import 'package:gasta_user_app/services/test_authentication_service.dart';
import 'package:gasta_user_app/services/test_survey_service.dart';

import 'services/services.dart';

class DependencyProvider {
  DependencyProvider._() {
    _surveyService = SurveyService();
    _saveService = SaveService();
    _userService = UserService();
    _couponService = TestCouponService();
    _authenticationService = AuthenticationService(userService: _userService);

    _appPageController =
        AppPageController(authenticationService: _authenticationService);
    _couponPageController = CouponPageController(
        authenticationService: _authenticationService,
        couponService: _couponService,
        saveService: _saveService);
    _loginPageController =
        LoginPageController(authenticationService: _authenticationService);
    _mapPageController = MapPageController();
    _scannerPageController = ScannerPageController(
        authenticationService: _authenticationService,
        surveyService: _surveyService,
        saveService: _saveService);
    _settingsPageController =
        SettingsPageController(authenticationService: _authenticationService);
    _shellPageController =
        ShellPageController(authenticationService: _authenticationService);
    _surveyPageController = SurveyPageController();
    _createUserDataPageController = CreateUserDataPageController(
        authenticationService: _authenticationService,
        userService: _userService);
    _signupPageController =
        SignupPageController(authenticationService: _authenticationService);
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

  late AppPageController _appPageController;
  AppPageController get appPageController => _appPageController;

  late CouponPageController _couponPageController;
  CouponPageController get couponPageController => _couponPageController;

  late LoginPageController _loginPageController;
  LoginPageController get loginPageController => _loginPageController;

  late MapPageController _mapPageController;
  MapPageController get mapPageController => _mapPageController;

  late ScannerPageController _scannerPageController;
  ScannerPageController get scannerPageController => _scannerPageController;

  late SettingsPageController _settingsPageController;
  SettingsPageController get settingsPageController => _settingsPageController;

  late ShellPageController _shellPageController;
  ShellPageController get shellPageController => _shellPageController;

  late SurveyPageController _surveyPageController;
  SurveyPageController get surveyPageController => _surveyPageController;

  late SignupPageController _signupPageController;
  SignupPageController get signupPageController => _signupPageController;

  late CreateUserDataPageController _createUserDataPageController;
  CreateUserDataPageController get createUserDataPageController =>
      _createUserDataPageController;
}
