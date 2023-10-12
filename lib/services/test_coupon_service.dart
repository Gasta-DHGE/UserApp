import 'package:gasta_core/gasta_core.dart' as core;
import 'package:http/http.dart' as http;

import '../models/models.dart';
import 'services.dart';

class TestCouponService implements ICouponService {
  late http.Client client;
  late core.CouponDataSource source;

  TestCouponService() {
    client = http.Client();
    source = core.CouponDataSourceImpl(client: client);
  }

  @override
  Future<Coupon> getCouponByCouponIdAsync(
      String userId, String couponId) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Coupon>> getCouponByUserIdAsync(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return <Coupon>[
      Coupon(
          id: '123123123',
          surveyId: '21312313',
          expiringDate: DateTime.now(),
          reward: FreeItemReward(
              name: 'testName',
              description: 'testDesc',
              type: core.SurveyRewardType.freeItem,
              item: '1 Cola'),
          companyInfo: CompanyInfo(
              name: '',
              address: const Address(
                  city: '',
                  street: '',
                  streetNumber: 1,
                  additionalInformation: '',
                  postcode: '',
                  posLongitude: 1,
                  posLatitude: 1),
              openingDays: {},
              companyId: ''))
    ];
  }
}
