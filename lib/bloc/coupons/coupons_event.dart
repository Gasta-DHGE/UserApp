part of 'coupons_bloc.dart';

@immutable
sealed class CouponsEvent extends Equatable {
  const CouponsEvent();

  @override
  List<Object> get props => [];
}

class LoadCoupons extends CouponsEvent {
  final String userId;

  const LoadCoupons({required this.userId});

  @override
  List<Object> get props => [userId];
}

class UpdateCoupons extends CouponsEvent {
  final String userId;

  const UpdateCoupons({required this.userId});

  @override
  List<Object> get props => [userId];
}
