part of 'scanner_bloc.dart';

@immutable
sealed class ScannerState extends Equatable {
  const ScannerState();

  @override
  List<Object> get props => [];
}

final class ScannerScanning extends ScannerState {}

final class ScannerLoading extends ScannerState {}

final class ScannerScanned extends ScannerState {
  final Survey survey;

  const ScannerScanned({required this.survey});

  @override
  List<Object> get props => [survey];
}
