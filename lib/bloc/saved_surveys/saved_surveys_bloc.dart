import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/models/survey/survey_data.dart';
import 'package:meta/meta.dart';

part 'saved_surveys_event.dart';
part 'saved_surveys_state.dart';

class SavedSurveysBloc extends Bloc<SavedSurveysEvent, SavedSurveysState> {
  SavedSurveysBloc() : super(SavedSurveysLoading()) {
    on<LoadSavedSurveys>(_onLoadSavedSurveys);
  }

  void _onLoadSavedSurveys(
      LoadSavedSurveys event, Emitter<SavedSurveysState> emit) async {
    emit(
      SavedSurveysLoaded(
        savedSurveys: await DependencyProvider.instance.saveService
            .loadSurveysAsync(event.userId),
      ),
    );
  }
}
