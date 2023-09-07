import 'package:gasta_user_app/services/authentication_service.dart';
import 'package:gasta_user_app/services/i_authentication_service.dart';
import 'package:gasta_user_app/services/i_save_service.dart';
import 'package:gasta_user_app/services/i_survey_service.dart';
import 'package:gasta_user_app/services/save_service.dart';
import 'package:gasta_user_app/services/survey_service.dart';
import 'package:gasta_user_app/services/test_survey_service.dart';

class ServiceProvider {
  ServiceProvider._();

  static final ServiceProvider instance = ServiceProvider._();

  final IAuthenticationService authenticationService = AuthenticationService();
  final ISurveyService surveyService = TestSurveyService();
  final ISaveService saveService = SaveService();
}
