// ignore: implementation_imports
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter_auth/app/core/interfaces/app_theme_interface.dart';

class AppThemeLight implements IAppThemeInterface {
  @override
  ThemeData getTheme() {
    return ThemeData.light();
  }
}
