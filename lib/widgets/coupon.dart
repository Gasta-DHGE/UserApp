import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:intl/intl.dart';
import '../models/models.dart' as models;

class Coupon extends StatelessWidget {
  final models.Coupon coupon;

  const Coupon({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Card(
          color: Theme.of(context).colorScheme.background,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  QRCode(
                    data: coupon.id,
                  ),
                  Text(
                    coupon.reward.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    coupon.companyInfo.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: coupon.expiringDate.year < DateTime.now().year + 50
                        ? Text(
                            'usable until ${DateFormat('dd.MM.yyyy').format(coupon.expiringDate)}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        : Text(
                            'no expiring',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      expands: true,
                      minLines: null,
                      maxLines: null,
                      controller: TextEditingController(
                        text: coupon.reward.description,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
