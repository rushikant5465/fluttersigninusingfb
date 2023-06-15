import 'package:flutter/material.dart';

class DarkTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black.withOpacity(0.5),

    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.green;
          }
          return null; // Use the component's default.
        },
      ),
    )),
    buttonTheme: const ButtonThemeData(buttonColor: Colors.orange),
    // textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.red)),
    // primaryTextTheme: Typography().white,
  );
}
