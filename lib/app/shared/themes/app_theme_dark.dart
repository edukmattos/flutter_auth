// ignore: implementation_imports
import 'package:flutter/src/material/theme_data.dart';

import '../../shared/themes/intrafaces/app_theme_interface.dart';

class AppThemeDark implements IAppTheme {
  @override
  ThemeData getTheme() {
    return ThemeData.dark();
  }
}
