import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:string_validator/string_validator.dart' as stringValidator;
import 'package:validators/validators.dart';

import 'package:flutter_auth/app/shared/auth/repositories/auth_repository.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  AuthRepository authRepository;

  _SettingsStoreBase(
    this.authRepository,
  ) {
    authRepository = Modular.get<AuthRepository>();
  }

  @observable
  String email = "";

  @action
  changeEmail(String value) {
    email = value;
    print(value);
  }

  @computed
  bool get isFormValid {
    return validateEmail() == null;
  }

  String? validateEmail() {
    var isValid = isNull(email);
    if (isValid) {
      return 'fields.warning_msg.required'.tr();
    } else {
      var isValid = stringValidator.isEmail(email);
      if (isValid) {
        return null;
      } else {
        return 'fields.error_msg.invalid'.tr();
      }
    }
  }

  @action
  Future<void> settingsStoreSettings({required String email}) async {}
}
