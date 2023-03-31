import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'theme/theme_manager.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late AppTheme theme = AppTheme.light();
  await Future.wait([
    AppTheme.fromStorage().then((value) => theme = value),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
  ]);
  runApp(App(theme: theme));
}
