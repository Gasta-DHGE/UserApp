import 'package:gastas_user_app/services/authentication_service.dart';
import 'package:gastas_user_app/services/i_authentication_service.dart';
import 'package:gastas_user_app/services/i_survey_service.dart';
import 'package:gastas_user_app/services/survey_service.dart';
import 'package:gastas_user_app/services/test_survey_service.dart';

class ServiceProvider {
  ServiceProvider._();

  static final ServiceProvider instance = ServiceProvider._();

  final IAuthenticationService authenticationService = AuthenticationService();
  final ISurveyService surveyService = TestSurveyService();
}
