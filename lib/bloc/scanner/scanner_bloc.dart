import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/models/survey/survey.dart';
import 'package:gasta_user_app/models/survey/survey_answer.dart';
import 'package:meta/meta.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc() : super(ScannerScanning()) {
    on<LoadSurvey>(_onLoadSurvey);
    on<SendSurvey>(_onSendSurvey);
    on<RefreshScanner>(_onRefreshScanner);
  }

  void _onLoadSurvey(LoadSurvey event, Emitter<ScannerState> emit) async {
    emit(ScannerLoading());
    try {
      emit(
        ScannerScanned(
          survey: await DependencyProvider.instance.surveyService
              .getSurveyByIdAsync(event.userId, event.surveyId),
        ),
      );
    } catch (e) {
      emit(
        ScannerScanning(),
      );
    }
  }

  void _onSendSurvey(SendSurvey event, Emitter<ScannerState> emit) async {
    emit(ScannerLoading());

    try {
      await DependencyProvider.instance.surveyService
          .sendSurveyAsync(event.userId, event.answer);
    } catch (e) {
      var test = '';
    }

    emit(ScannerScanning());
  }

  void _onRefreshScanner(
      RefreshScanner event, Emitter<ScannerState> emit) async {
    emit(ScannerScanning());
  }
}
