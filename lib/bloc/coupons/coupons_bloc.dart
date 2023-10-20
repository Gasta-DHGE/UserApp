import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gasta_user_app/dependency_provider.dart';
import 'package:gasta_user_app/models/coupon.dart';
import 'package:meta/meta.dart';

part 'coupons_event.dart';
part 'coupons_state.dart';

class CouponsBloc extends Bloc<CouponsEvent, CouponsState> {
  CouponsBloc() : super(const CouponsLoaded()) {
    on<LoadCoupons>(_onLoadCoupons);
    on<UpdateCoupons>(_onUpdateCoupons);
  }

  void _onLoadCoupons(LoadCoupons event, Emitter<CouponsState> emit) async {
    emit(
      CouponsLoading(),
    );
    emit(
      CouponsLoaded(
        coupons: await DependencyProvider.instance.couponService
            .getCouponByUserIdAsync(event.userId),
      ),
    );
  }

  void _onUpdateCoupons(UpdateCoupons event, Emitter<CouponsState> emit) async {
    emit(
      CouponsLoaded(
        coupons: await DependencyProvider.instance.couponService
            .getCouponByUserIdAsync(event.userId),
      ),
    );
  }
}
