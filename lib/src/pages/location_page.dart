import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../common/errors/api_exception.dart';
import '../common/errors/connection_exception.dart';
import '../common/services/geolocation_service.dart';
import '../features/weather/cubit/weather_cubit.dart';
import '../features/weather/models/location.dart';
import '../features/weather/widgets/location_view.dart';
import '../features/weather/widgets/search_button.dart';
import '../utils/constants/pages.dart';
import '../utils/helpers/snackbar_utils.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  late Completer<void> _completer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manage locations",
        ),
      ),
      body: RefreshIndicator.adaptive(
        key: _refreshIndicatorKey,
        onRefresh: () => _completer.future,
        notificationPredicate: (notification) => false,
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state.hasError) {
              _onError(state.error!);
            }
          },
          builder: (context, state) {
            if (state.forecasts.isNotEmpty) {
              return LocationView(
                state.forecasts,
                onSelect: _onSelect,
                onDissmis: _onRemove,
                onRefresh: _onRefresh,
                onReorder: _onReorder,
              );
            } else {
              return const Placeholder();
            }
          },
        ),
      ),
      floatingActionButton: SearchButton(
        onSelect: _onAdd,
        onUseGeolocation: _onAddUsingGeolocation,
      ),
    );
  }

  Future<void> _onRefresh() async {
    await context.read<WeatherCubit>().updateAllWeather();
  }

  void _onAdd(Location location) async {
    _completer = Completer();
    _refreshIndicatorKey.currentState?.show();

    await context.read<WeatherCubit>().addWeather(location);

    _completer.complete();
  }

  void _onAddUsingGeolocation() async {
    _completer = Completer();
    _refreshIndicatorKey.currentState?.show();

    await context.read<WeatherCubit>().addWeatherUsingGeolocation();

    _completer.complete();
  }

  void _onRemove(int index) {
    context.read<WeatherCubit>().removeWeather(index);
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    context.read<WeatherCubit>().reorderWeather(oldIndex, newIndex);
  }

  void _onSelect(int index) {
    context.goNamed(Pages.weather, extra: index);
  }

  void _onError(Object error) {
    switch (error.runtimeType) {
      case ConnectionException:
        SnackbarUtils.showSnackBar(
            "Connection error. Please check your internet connection or try again later.");
      case ApiException:
        SnackbarUtils.showSnackBar(
            "Can't get weather. Please try again later.");
      case GeolocationException:
        SnackbarUtils.showSnackBar(
            "Can't determine geolocation. Check if geolocation is enabled and try again.");
    }
  }
}
