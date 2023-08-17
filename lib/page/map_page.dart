import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<StatefulWidget> createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  //static MapPageController controller = MapPageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Map",
            style: TextStyles.bigHeadlineTextStyle(context),
          ),
        ],
      ),
    );
  }
}
