import 'package:http/http.dart' as http;
import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/services/interfaces/i_coupon_service.dart';

class CouponService implements ICouponService {
  late http.Client client;
  late core.CouponDataSource source;

  CouponService() {
    client = http.Client();
    source = core.CouponDataSourceImpl(client: client);
  }

  @override
  Future<List<core.CouponEntity>> getCouponsByUserId(String userId) async {
    return await source.getCouponsOfUser(userId);
  }

  @override
  Future<core.CouponEntity> getCouponByCouponIdAsync(
      String userId, String couponId) async {
    return await source.getCouponByCouponId(couponId, userId);
  }
}
