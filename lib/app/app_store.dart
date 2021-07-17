import 'package:mobx/mobx.dart';

import 'shared/shared_preferences/repositories/interfaces/shared_repository_interface.dart';
import 'shared/shared_preferences/repositories/shared_repository.dart';
import 'shared/themes/app_theme_dark.dart';
import 'shared/themes/app_theme_light.dart';
import 'shared/themes/intrafaces/app_theme_interface.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  ISharedRepository sharedRepository = SharedRepository();

  _AppStoreBase() {
    sharedPrefsThemeLoad();
  }

  @observable
  bool isDark = false;

  @action
  changeIsDark(bool value) {
    isDark = value;
    setTheme(value);
    print(value);
  }

  @observable
  IAppTheme appTheme = AppThemeLight();

  @action
  sharedPrefsThemeLoad() async {
    //Verifica se existe o parametro armazenado no SharedPreferences
    await sharedRepository.containsValue('isDark').then(
      (value) async {
        //print("value: $value");
        if (value) {
          //Existe o parametro e pega o seu valor
          await sharedRepository.getValue<bool>('isDark').then(
            (value) {
              setTheme(value);
            },
          );
        } else {
          //Se não existe o parametro
          appTheme = AppThemeLight();
          isDark = false;
          setTheme(isDark);
        }
      },
    ).catchError(
      (e) {
        print(e);
      },
    );
  }

  @action
  setTheme(value, {bool saveShared = true}) async {
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
