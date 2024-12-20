import 'package:betalent/app_widget.dart';
import 'package:betalent/core/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependecies();

  runApp(const AppWidget());
}
