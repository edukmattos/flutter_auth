import 'package:mobx/mobx.dart';

import 'core/interfaces/app_theme_interface.dart';
import 'core/interfaces/shared_repository_interface.dart';
import 'core/repositories/shared_repository.dart';
import 'core/themes/app_theme_dark.dart';
import 'core/themes/app_theme_light.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  ISharedRepositoryInterface sharedRepository = SharedRepository();

  _AppStoreBase() {
    sharedPrefsThemeLoad();
  }

  @observable
  bool isDark = false;

  @action
  changeIsDark(bool value) {
    isDark = value;
    setThemeData(value);
    print(value);
  }

  @observable
  IAppThemeInterface appTheme = AppThemeLight();

  @action
  sharedPrefsThemeLoad() async {
    await sharedRepository.getValue<bool>('isDark').then(
      (value) {
        setThemeData(value);
      },
    );
  }

  @action
  setThemeData(value, {bool saveShared = true}) async {
    //print("themeMode: $themeMode");
    //if (value == null) {
    //  appTheme = AppThemeDark();
    //  //isDark = true;
    //}
    if (value) {
      appTheme = AppThemeDark();
      isDark = true;
    } else {
      appTheme = AppThemeLight();
      isDark = false;
    }

    print("isDark: $isDark");
    if (saveShared) {
      sharedPrefsThemeSave();
    }
  }

  sharedPrefsThemeSave() async {
    await sharedRepository.setValue<bool>('isDark', isDark);
  }
}
