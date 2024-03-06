import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Di.initDependencies();

  runApp(const App());
}
