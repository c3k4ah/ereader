import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';
import 'dependency_injection/injection.dart';

Future<void> main() async {
  await initializeDateFormatting('fr_FR', null);
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(const MyApp());
}
// dart run build_runner build --delete-conflicting-outputs