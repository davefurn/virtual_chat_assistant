import 'package:flutter/material.dart';
import 'package:virtual_chat_assistant/src/utils/theme/widget_theme/text_theme.dart';

import '../../extensions/swatch.dart';

class BotTheme {
  BotTheme._();
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xfffcb900),
    primarySwatch: createMaterialColor(const Color(0xfffcb900)),
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: TextsTheme.lightTheme,
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff272727),
    primarySwatch: createMaterialColor(const Color(0xff272727)),
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: TextsTheme.darkTheme,
  );
}
