import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<StatefulWidget> createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  //static MapPageController controller = MapPageController();

  var controller = MapController(
    initMapWithUserPosition: UserTrackingOption(),
  );

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
