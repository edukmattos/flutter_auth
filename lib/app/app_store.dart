import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
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
  }
}
