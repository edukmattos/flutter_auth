import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:string_validator/string_validator.dart' as stringValidator;
import 'package:validators/validators.dart';

import 'package:flutter_auth/app/shared/auth/repositories/auth_repository.dart';

part 'password_reset_store.g.dart';

class PasswordResetStore = _PasswordResetStoreBase with _$PasswordResetStore;

abstract class _PasswordResetStoreBase with Store {
  AuthRepository authRepository;

  _PasswordResetStoreBase(
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
  Future<void> passwordResetStorePasswordReset({required String email}) async {
    await authRepository.authRepoPasswordReset(email).then((response) {
      if (response.success) {
        Modular.to.pushNamed('/sign_in');
      } else {
        throw response;
      }
    });
  }
}
