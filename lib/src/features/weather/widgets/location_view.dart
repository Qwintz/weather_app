import 'package:flutter/material.dart';

import '../models/forecast.dart';
import 'weather_tile.dart';

class LocationView extends StatelessWidget {
  const LocationView(
    this.forecasts, {
    super.key,
    required this.onSelect,
    required this.onDissmis,
    required this.onRefresh,
    required this.onReorder,
  });

  final List<Forecast> forecasts;
  final void Function(int index) onSelect;
  final void Function(int index) onDissmis;
  final void Function(int oldIndex, int newIndex) onReorder;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: onRefresh,
      child: ReorderableListView.builder(
        itemCount: forecasts.length,
        onReorder: onReorder,
        itemBuilder: (context, index) {
          final weather = forecasts[index];

          return WeatherTile(
            weather,
            key: ValueKey(weather),
            onTap: () => onSelect(index),
            onDissmis: () => onDissmis(index),
          );
        },
      ),
    );
  }
}
