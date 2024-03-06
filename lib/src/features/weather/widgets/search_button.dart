import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/errors/api_exception.dart';
import '../../../common/errors/connection_exception.dart';
import '../../../utils/helpers/debouncer.dart';
import '../../../utils/helpers/snackbar_utils.dart';
import '../models/location.dart';
import '../repositories/location_repository.dart';
import 'location_tile.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({
    super.key,
    required this.onSelect,
    required this.onUseGeolocation,
  });

  final void Function(Location location) onSelect;
  final void Function() onUseGeolocation;

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  final _searchController = SearchController();
  final _debouncer = Debouncer();

  String? _currentQuery;
  List<Location> _lastSuggestions = const [];

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: _searchController,
      builder: (context, controller) {
        return FloatingActionButton(
          onPressed: _onOpenView,
          child: const Icon(Icons.search_rounded),
        );
      },
      viewHintText: "Type city name...",
      viewTrailing: [
        IconButton(
          onPressed: _onClear,
          icon: const Icon(Icons.clear_rounded),
        ),
        IconButton(
          onPressed: _onUseGeolocation,
          icon: const Icon(Icons.gps_fixed_rounded),
        ),
      ],
      viewBuilder: (suggestions) {
        return Scaffold(
          body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
              children: List.from(suggestions),
            ),
          ),
        );
      },
      suggestionsBuilder: (context, controller) async {
        try {
          final suggestions =
              await _debouncer(() => _onSearch(controller.text));

          if (suggestions != null) {
            _lastSuggestions = suggestions;
          }
        } catch (error) {
          _onError(error);
        }

        return List.from(
          _lastSuggestions.map((location) {
            return LocationTile(
              location,
              onTap: () => _onSelect(location),
            );
          }),
        );
      },
    );
  }

  void _onOpenView() async {
    _searchController
      ..clear()
      ..openView();
  }

  void _onClear() {
    _searchController.clear();
  }

  Future<List<Location>?> _onSearch(String query) async {
    if (query.isEmpty) {
      return const [];
    }

    _currentQuery = query;
    final suggestions =
        context.read<LocationRepository>().requestLocations(query);

    if (_currentQuery != query) {
      return null;
    }

    _currentQuery = null;

    return suggestions;
  }

  void _onSelect(location) {
    widget.onSelect(location);
    _searchController
      ..clear()
      ..closeView(null);
  }

  void _onUseGeolocation() {
    widget.onUseGeolocation();
    _searchController
      ..clear()
      ..closeView(null);
  }

  void _onError(Object error) {
    switch (error.runtimeType) {
      case ConnectionException:
        SnackbarUtils.showSnackBar(
            "Connection error. Please check your internet connection or try again later.");
      case ApiException:
        SnackbarUtils.showSnackBar(
            "Can't get locations. Please try again later.");
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }
}
