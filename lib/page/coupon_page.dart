import 'package:flutter/material.dart';
import 'package:gastas_core/src/ui/general/text_styles.dart';

class CouponPage extends StatefulWidget {
  const CouponPage({super.key});

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
