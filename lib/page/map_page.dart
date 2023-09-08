import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:gasta_user_app/controller/map_page_controller.dart';

// ignore: must_be_immutable
class MapPage extends StatefulWidget {
  MapPageController controller;
  MapPage({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Column(
          children: [
            Text(
              "Map",
              style: TextStyles.bigHeadlineTextStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}
