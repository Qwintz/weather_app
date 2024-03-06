import 'dart:async';

import 'package:flutter/material.dart';

class DebounceTimer {
  DebounceTimer({this.delay = Durations.long2}) {
    _timer = Timer(delay, _completer.complete);
  }

  final Duration delay;

  late final Timer _timer;
  final _completer = Completer<void>();

  Future<void> get future => _completer.future;

  bool get isCompleted => _completer.isCompleted;

  void cancel() {
    _timer.cancel();
    if (!isCompleted) {
      _completer.completeError(
        const CancelException(),
      );
    }
  }
}

class Debouncer {
  Debouncer({this.delay = Durations.long2});

  final Duration delay;

  DebounceTimer? _debounceTimer;

  Future<T?> call<T>(Future<T?> Function() callback) async {
    if (_debounceTimer != null && !_debounceTimer!.isCompleted) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = DebounceTimer(delay: delay);

    try {
      await _debounceTimer!.future;
    } on CancelException {
      return null;
    }

    return callback();
  }

  void dispose() {
    _debounceTimer?.cancel();
  }
}

class CancelException implements Exception {
  const CancelException();
}
