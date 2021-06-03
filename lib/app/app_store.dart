import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  _AppStoreBase() {
    loadThemePrefs();
  }

  @observable
  ThemeData themeData = ThemeData.light();

  @computed
  bool get isDark => themeData.brightness == Brightness.dark;

  @action
  void changeTheme() {
    if (isDark) {
      print("dark: $isDark");
      themeData = ThemeData.light();
      print(themeData);
    } else {
      print("dark: $isDark");
      themeData = ThemeData.dark();
      print(themeData);
    }
    saveThemePrefs();
  }

  void saveThemePrefs() {
    SharedPreferences.getInstance().then((instance) {
      instance.setBool('isDark', isDark);
    });
  }

  void loadThemePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    //Future.delayed(Duration(seconds: 5));
    if (prefs.containsKey('isDark') && prefs.getBool('isDark')!) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData.light();
    }
  }
}
