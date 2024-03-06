import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../di.dart';
import '../features/weather/cubit/weather_cubit.dart';
import '../features/weather/models/daily_weather.dart';
import '../features/weather/models/hourly_weather.dart';
import '../utils/constants/pages.dart';
import '../utils/constants/ui_constants.dart';
import '../utils/extensions/extensions.dart';
import '../utils/helpers/storage.dart';
import '../utils/helpers/ui_utils.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key, int? initialPage})
      : _initialPage = initialPage ?? 0;

  final int _initialPage;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget._initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _onOnboarding,
          icon: const Icon(Icons.apps_rounded),
        ),
        actions: [
          IconButton(
            onPressed: _onManageLocations,
            icon: const Icon(Icons.place_rounded),
          ),
          IconButton(
            onPressed: _onSettings,
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return PageView.builder(
            controller: _pageController,
            itemCount: state.forecasts.length,
            itemBuilder: (context, index) {
              final forecast = state.forecasts[index];

              return RefreshIndicator.adaptive(
                onRefresh: () => _onRefresh(index),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Text(
                            forecast.location.name,
                            style: context.theme.textTheme.headlineLarge,
                          ),
                          const SizedBox(height: UiConstants.medium),
                          CircleAvatar(
                            radius: UiConstants.heroSize / 1.2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  UiUtils.getIcon(
                                      forecast.data.current.conditions.first),
                                  width: UiConstants.heroSize,
                                  height: UiConstants.heroSize,
                                ),
                                Text(
                                  UiUtils.getWeatherName(
                                    forecast.data.current.conditions.first,
                                  ),
                                  style: context.theme.textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    HourlyWeatherView(forecast.data.hourly),
                    DailyWeatherView(forecast.data.daily),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 200.0),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _onOnboarding() {
    Di.get<Storage>().saveOnboardingFlag(false);
    context.goNamed(Pages.onboarding);
  }

  void _onManageLocations() {
    context.goNamed(Pages.location);
  }

  void _onSettings() {
    context.goNamed(Pages.settings);
  }

  Future<void> _onRefresh(int index) async {
    await context.read<WeatherCubit>().updateWeather(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class HourlyWeatherView extends StatelessWidget {
  const HourlyWeatherView(this.forecast, {super.key});

  final List<HourlyWeather> forecast;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 160.0,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: forecast.length,
          itemBuilder: (context, index) {
            final weather = forecast[index];

            return Padding(
              padding: const EdgeInsets.all(UiConstants.medium),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    switch (index) {
                      0 => "Now",
                      _ => "${weather.time.hour}:00",
                    },
                    style: context.theme.textTheme.labelMedium,
                  ),
                  CircleAvatar(
                    radius: UiConstants.large,
                    child: SvgPicture.asset(
                      UiUtils.getIcon(weather.conditions.first),
                      width: UiConstants.extraLarge,
                      height: UiConstants.extraLarge,
                    ),
                  ),
                  Text(
                    "${weather.temp.toStringAsFixed(0)} ℃",
                    style: context.theme.textTheme.titleMedium,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class DailyWeatherView extends StatelessWidget {
  const DailyWeatherView(this.forecast, {super.key});

  final List<DailyWeather> forecast;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: forecast.length,
      itemBuilder: (context, index) {
        final weather = forecast[index];

        return ListTile(
          title: Text(
            switch (index) {
              0 => "Today",
              1 => "Tomorrow",
              _ => weather.time.weekday.toString(),
            },
            style: context.theme.textTheme.titleMedium,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${weather.temp.max.toStringAsFixed(0)} ℃",
                style: context.theme.textTheme.labelMedium,
              ),
              const SizedBox(width: UiConstants.medium),
              CircleAvatar(
                radius: UiConstants.large,
                child: SvgPicture.asset(
                  UiUtils.getIcon(weather.conditions.first),
                  width: UiConstants.extraLarge,
                  height: UiConstants.extraLarge,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
