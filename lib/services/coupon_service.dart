import 'package:gasta_core/gasta_core.dart' as core;
import 'package:http/http.dart' as http;

import '../models/models.dart';
import 'services.dart';

class CouponService implements ICouponService {
  late http.Client client;
  late core.CouponDataSource source;

  CouponService() {
    client = http.Client();
    source = core.CouponDataSourceImpl(client: client);
  }

  @override
  Future<Coupon> getCouponByCouponIdAsync(
      String userId, String couponId) async {
    return MappingService.map<core.CouponModel, Coupon>(
        await source.getCouponByCouponId(couponId, userId));
  }

  @override
  Future<List<Coupon>> getCouponByUserIdAsync(String userId) async {
    var couponModels = await source.getCouponsOfUser(userId);

    List<Coupon> coupons = [];
    for (var coupon in couponModels) {
      coupons.add(MappingService.map<core.CouponModel, Coupon>(coupon));
    }

    return coupons;
  }
}
