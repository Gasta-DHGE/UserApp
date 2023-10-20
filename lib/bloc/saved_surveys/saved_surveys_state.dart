part of 'saved_surveys_bloc.dart';

@immutable
sealed class SavedSurveysState extends Equatable {
  const SavedSurveysState();

  @override
  List<Object> get props => [];
}

final class SavedSurveysLoading extends SavedSurveysState {}

final class SavedSurveysLoaded extends SavedSurveysState {
  final List<SurveyData> savedSurveys;

  const SavedSurveysLoaded({this.savedSurveys = const <SurveyData>[]});

  @override
  List<Object> get props => [savedSurveys];
}
