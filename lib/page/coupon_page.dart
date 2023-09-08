import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/controller/controller.dart';

// ignore: must_be_immutable
class CouponPage extends StatefulWidget {
  CouponPageController controller;
  CouponPage({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _CouponPage();
}

class _CouponPage extends State<CouponPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Coupons",
            style: TextStyles.bigHeadlineTextStyle(context),
          )
        ],
      ),
    );
  }
}
