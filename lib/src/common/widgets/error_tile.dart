import 'package:flutter/material.dart';

import '../../utils/extensions/extensions.dart';

class ErrorTile extends StatelessWidget {
  const ErrorTile(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: context.theme.colorScheme.error,
      leading: Icon(
        Icons.error_rounded,
        color: context.theme.colorScheme.onError,
      ),
      title: Text(
        text,
        style: context.theme.textTheme.bodyMedium?.copyWith(
          color: context.theme.colorScheme.onError,
        ),
      ),
    );
  }
}
