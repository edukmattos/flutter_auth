// ignore: implementation_imports
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter_auth/app/shared/themes/intrafaces/app_theme_interface.dart';

class AppThemeLight implements IAppTheme {
  @override
  ThemeData getTheme() {
    return ThemeData.light();
  }
}
