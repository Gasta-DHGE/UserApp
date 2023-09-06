import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FadeBorder extends StatelessWidget {
  Widget child;

  FadeBorder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.background,
            Colors.transparent,
            Colors.transparent,
            Theme.of(context).colorScheme.background,
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          stops: const [0, 0.1, 0.9, 1.0],
        ),
      ),
      child: Container(
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.background,
              Colors.transparent,
              Colors.transparent,
              Theme.of(context).colorScheme.background,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, 0.1, 0.9, 1.0],
          ),
        ),
        child: child,
      ),
    );
  }
}
