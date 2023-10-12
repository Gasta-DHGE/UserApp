import '../models/models.dart';

abstract class ICouponService {
  Future<Coupon> getCouponByCouponIdAsync(String userId, String couponId);
  Future<List<Coupon>> getCouponByUserIdAsync(String userId);
}
