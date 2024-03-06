import 'package:flutter/material.dart';

import '../../../utils/extensions/extensions.dart';
import '../models/location.dart';

class LocationTile extends StatelessWidget {
  const LocationTile(
    this.location, {
    super.key,
    this.onTap,
  });

  final void Function()? onTap;
  final Location location;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        location.name,
        style: context.theme.textTheme.titleMedium,
      ),
      subtitle: Text(
        "${location.region}, ${location.country}",
        style: context.theme.textTheme.bodyMedium,
      ),
      trailing: const Icon(Icons.add_rounded),
    );
  }
}
