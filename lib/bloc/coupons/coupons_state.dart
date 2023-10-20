part of 'coupons_bloc.dart';

@immutable
sealed class CouponsState extends Equatable {
  const CouponsState();

  @override
  List<Object> get props => [];
}

final class CouponsLoading extends CouponsState {}

final class CouponsLoaded extends CouponsState {
  final List<Coupon> coupons;

  const CouponsLoaded({this.coupons = const <Coupon>[]});

  @override
  List<Object> get props => [coupons];
}
