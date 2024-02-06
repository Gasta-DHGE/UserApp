import 'package:gasta_core/gasta_core.dart';

abstract class ICouponService {
  Future<List<CouponEntity>> getCouponsByUserId(String userId);
  Future<CouponEntity> getCouponByCouponIdAsync(String userId, String couponId);
}
