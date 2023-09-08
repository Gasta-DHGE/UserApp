import 'package:gasta_user_app/controller/controller.dart';
import 'package:gasta_user_app/services/test_authentication_service.dart';
import 'package:gasta_user_app/services/i_authentication_service.dart';
import 'package:gasta_user_app/services/i_save_service.dart';
import 'package:gasta_user_app/services/i_survey_service.dart';
import 'package:gasta_user_app/services/save_service.dart';
// ignore: unused_import
import 'package:gasta_user_app/services/survey_service.dart';
import 'package:gasta_user_app/services/test_survey_service.dart';

class DependencyProvider {
  DependencyProvider._() {
    _authenticationService = TestAuthenticationService();
    _surveyService = TestSurveyService();
    _saveService = SaveService();

    _appPageController =
        AppPageController(authenticationService: _authenticationService);
    _couponPageController = CouponPageController();
    _loginPageController =
        LoginPageController(authenticationService: _authenticationService);
    _mapPageController = MapPageController();
    _scannerPageController = ScannerPageController(
        surveyService: _surveyService, saveService: _saveService);
    _settingsPageController =
        SettingsPageController(authenticationService: _authenticationService);
    _shellPageController = ShellPageController();
    _surveyPageController = SurveyPageController();
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
}
