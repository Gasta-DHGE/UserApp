import 'package:flutter/material.dart';
import 'package:gasta_core/gasta_core.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<StatefulWidget> createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Partner Map",
            style: Styles.bigHeadlineTextStyle(context),
          ),
          Expanded(
              child: Center(
            child: Text(
              "Feature coming soon",
              style: Styles.headlineTextStyle(context),
            ),
          ))
        ],
      ),
    );
  }
}
