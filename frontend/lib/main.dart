import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app/app.dart';
import 'app/di/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Clean path-based URLs (/scanner) instead of hash fragments (/#/scanner).
  // Requires the host to rewrite unknown paths to index.html — see vercel.json.
  usePathUrlStrategy();
  await configureDependencies();
  runApp(const CandleXApp());
}
