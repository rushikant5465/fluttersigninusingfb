import 'package:flutter/material.dart';
import 'package:fluttersigninusingfb/utils/themes/dark.dart';
import 'package:fluttersigninusingfb/utils/themes/theme_mode.dart';
import 'package:provider/provider.dart';
import './utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SelectedThemeChangeNotifier(),
        builder: (context, _) {
          final themeProvider =
              Provider.of<SelectedThemeChangeNotifier>(context);
          print(themeProvider.theme);
          return MaterialApp(
            title: 'Flutter Demo',
            darkTheme: DarkTheme.darkTheme,
            themeMode: themeProvider.theme,
            routes: Routes.routes,
            initialRoute: RoutePath.login,
          );
        });
  }
}
