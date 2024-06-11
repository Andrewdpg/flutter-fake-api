import 'package:flutter/material.dart';
import 'package:new_app/config/theme.dart';

import 'config/global_config.dart';
import 'config/routes.dart';

/// The entry point of the application.
void main() async {
  runApp(const App());
}

/// The root widget of the application.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return _mainApp();
  }
}

/// Builds the main MaterialApp widget.
MaterialApp _mainApp() {
  return MaterialApp(
    title: AppConfig.title,
    initialRoute: AppConfig.initialRoute,
    debugShowCheckedModeBanner: false,
    onGenerateRoute: (RouteSettings settings) => appRoutes(settings),
    themeMode: ThemeMode.system,
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
  );
}
