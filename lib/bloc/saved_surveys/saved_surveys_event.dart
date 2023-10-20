part of 'saved_surveys_bloc.dart';

@immutable
sealed class SavedSurveysEvent extends Equatable {
  const SavedSurveysEvent();

  @override
  List<Object> get props => [];
}

class LoadSavedSurveys extends SavedSurveysEvent {
  final String userId;

  const LoadSavedSurveys({required this.userId});

  @override
  List<Object> get props => [userId];
}
