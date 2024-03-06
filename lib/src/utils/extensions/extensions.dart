import 'package:flutter/material.dart';

extension ContextExtenstion on BuildContext {
  ThemeData get theme => Theme.of(this);
  MediaQueryData get media => MediaQuery.of(this);
}
