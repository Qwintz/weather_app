import 'package:flutter/material.dart';

import '../../common/widgets/error_tile.dart';

abstract class SnackbarUtils {
  static final scaffoldMessangerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String text) {
    scaffoldMessangerKey.currentState?.showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        dismissDirection: DismissDirection.horizontal,
        content: ErrorTile(text),
      ),
    );
  }

  static void clearSnackBars() {
    scaffoldMessangerKey.currentState?.clearSnackBars();
  }
}
