import 'package:gasta_user_app/services/mapping_service.dart';
import 'package:http/http.dart' as http;
import 'package:gasta_user_app/services/i_survey_service.dart';
import 'package:gasta_core/gasta_core.dart' as core;
import '../models/models.dart';

class SurveyService implements ISurveyService {
  late http.Client client;
  late core.SurveyRemoteDataSourceImpl surveySource;
  late core.SurveyDataRemoteDataSourceImpl dataSource;

  SurveyService() {
    client = http.Client();
    surveySource = core.SurveyRemoteDataSourceImpl(client: client);
    dataSource = core.SurveyDataRemoteDataSourceImpl(client: client);
  }

  @override
  Future<Survey> getSurveyByIdAsync(String userId, String surveyId) async {
    return MappingService.map<core.SurveyModel, Survey>(
        await surveySource.getSurveyById(userId, surveyId));
  }

  @override
  Future createSurveyAsync(String userId, Survey survey) async {
    await surveySource.createSurvey(
        userId, MappingService.map<Survey, core.SurveyModel>(survey));
  }

  @override
  Future<void> sendSurveyAsync(String userId, SurveyAnswer answer) async {
    await dataSource.createSurveyData(userId,
        MappingService.map<SurveyAnswer, core.SurveyAnswerEntity>(answer));
  }
}
