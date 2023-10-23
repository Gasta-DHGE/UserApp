part of 'scanner_bloc.dart';

@immutable
sealed class ScannerEvent extends Equatable {
  const ScannerEvent();

  @override
  List<Object> get props => [];
}

class LoadSurvey extends ScannerEvent {
  final String userId;
  final String surveyId;

  const LoadSurvey({required this.userId, required this.surveyId});

  @override
  List<Object> get props => [userId, surveyId];
}

class SendSurvey extends ScannerEvent {
  final String userId;
  final SurveyAnswer answer;

  const SendSurvey({required this.userId, required this.answer});

  @override
  List<Object> get props => [answer];
}

class RefreshScanner extends ScannerEvent {}
