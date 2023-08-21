import 'package:gastas_user_app/services/mapping_service.dart';
import 'package:http/http.dart' as http;
import 'package:gastas_user_app/services/i_survey_service.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import '../models/models.dart';

class SurveyService implements ISurveyService {
  late http.Client client;
  late core.SurveyRemoteDataSourceImpl source;

  SurveyService() {
    client = http.Client();
    source = core.SurveyRemoteDataSourceImpl(client: client);
  }

  @override
  Future<Survey?> getSurveyByIdAsync(String userId, String surveyId) async {
    var model = await source.getSurveyById(userId, surveyId);
    var map = MappingService.map<core.SurveyModel, Survey>(model);
    return MappingService.map<core.SurveyModel, Survey>(model);
  }

  @override
  Future createSurveyAsync(String userId, Survey survey) async {
    await source.createSurvey(
        userId, MappingService.map<Survey, core.SurveyModel>(survey));
  }

  @override
  Future<bool> sendSurveyAsync(core.SurveyAnswer answer) {
    // TODO: implement sendSurveyAsync
    throw UnimplementedError();
  }

  @override
  Future<core.Survey> getSurveyAsync(String surveyId) {
    // TODO: implement getSurveyAsync
    throw UnimplementedError();
  }
}
