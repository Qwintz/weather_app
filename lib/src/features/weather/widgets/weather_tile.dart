import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/ui_constants.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../utils/helpers/ui_utils.dart';
import '../models/forecast.dart';

class WeatherTile extends StatelessWidget {
  const WeatherTile(
    this.weather, {
    super.key,
    required this.onTap,
    required this.onDissmis,
  });

  final Forecast weather;
  final void Function() onTap;
  final void Function() onDissmis;

  @override
  Widget build(BuildContext context) {
    final currentWeather = weather.data.current;

    return Slidable(
      endActionPane: ActionPane(
        extentRatio: .25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            autoClose: false,
            backgroundColor: context.theme.colorScheme.error,
            foregroundColor: context.theme.colorScheme.onError,
            icon: Icons.delete,
            onPressed: (context) {
              final controller = Slidable.of(context);
              controller!.dismiss(
                ResizeRequest(
                  Durations.medium2,
                  onDissmis,
                ),
                duration: Durations.medium2,
                curve: Curves.easeOut,
              );
            },
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        trailing: const Icon(Icons.drag_indicator_rounded),
        title: Text(
          weather.location.name,
          style: context.theme.textTheme.titleMedium,
        ),
        subtitle: Text(
          "${weather.location.region}, ${weather.location.country}",
          style: context.theme.textTheme.bodyMedium,
        ),
        leading: CircleAvatar(
          radius: UiConstants.large,
          child: SvgPicture.asset(
            UiUtils.getIcon(currentWeather.conditions.first),
            width: UiConstants.extraLarge,
            height: UiConstants.extraLarge,
          ),
        ),
      ),
    );
  }
}
