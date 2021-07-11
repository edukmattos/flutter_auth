// ignore: implementation_imports
import 'package:flutter/src/material/theme_data.dart';

import '../interfaces/app_theme_interface.dart';

class AppThemeDark implements IAppThemeInterface {
  @override
  ThemeData getTheme() {
    return ThemeData.dark();
  }
}
